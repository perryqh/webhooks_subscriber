# frozen_string_literal: true

RSpec.describe WebhookEvent, type: :model do
  subject(:webhook_event) { build(:webhook_event) }

  let(:subscriber) { webhook_event.subscriber }

  it { is_expected.to belong_to :subscriber }

  describe 'turbo broadcast' do
    context 'when creating' do
      it 'broadcasts event' do
        allow(webhook_event).to receive(:broadcast_prepend_later_to)
        webhook_event.save!
        expect(webhook_event)
          .to have_received(:broadcast_prepend_later_to)
          .with(subscriber,
                :webhook_events,
                target: :webhook_events,
                locals: { highlight: true })
      end
    end

    context 'when updating' do
      before { webhook_event.save! }

      it 'does not broadcast event' do
        allow(webhook_event).to receive(:broadcast_prepend_later_to)
        webhook_event.update!(payload: { name: 'event-name' })
        expect(webhook_event).not_to have_received(:broadcast_prepend_later_to)
      end
    end
  end
end
