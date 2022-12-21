# frozen_string_literal: true

RSpec.describe WebhookEvent, type: :model do
  subject(:webhook_event) { build(:webhook_event) }

  let(:subscriber) { webhook_event.subscriber }

  it { is_expected.to belong_to :subscriber }

  describe 'turbo broadcast' do
    context 'when creating' do
      before do
        allow(Turbo::StreamsChannel).to receive(:broadcast_prepend_later_to)
      end

      it 'broadcasts event' do
        webhook_event.save!
        expect(Turbo::StreamsChannel)
          .to have_received(:broadcast_prepend_later_to)
          .with(subscriber,
                :webhook_events,
                locals: { highlight: true,
                          webhook_event: },
                target: :webhook_events,
                partial: 'webhook_events/webhook_event')
      end
    end

    context 'when updating' do
      before do
        webhook_event.save!
        allow(Turbo::StreamsChannel).to receive(:broadcast_prepend_later_to)
      end

      it 'does not broadcast event' do
        webhook_event.update!(payload: { name: 'event-name' })
        expect(Turbo::StreamsChannel).not_to have_received(:broadcast_prepend_later_to)
      end
    end
  end
end
