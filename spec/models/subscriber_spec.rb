# frozen_string_literal: true

RSpec.describe Subscriber, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:webhook_events).dependent(:destroy) }
  it { is_expected.to validate_presence_of :name }

  describe '#last_webhook_event' do
    subject(:last_event) { subscriber.last_webhook_event }

    let(:subscriber) { create(:subscriber) }

    context 'with no events' do
      it { is_expected.to be_nil }
    end

    context 'with multiple events' do
      let!(:event_1) { create(:webhook_event, subscriber:) }
      let!(:event_2) { create(:webhook_event, subscriber:, created_at: 2.hours.ago) }

      it 'returns the last created event' do
        expect(last_event).to eq(event_1)
      end
    end
  end
end
