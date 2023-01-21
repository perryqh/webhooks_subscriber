# frozen_string_literal: true

require 'rails_helper'

describe DestroyOldEventsJob do
  describe '#perform' do
    subject(:perform) { described_class.new.perform }

    let!(:old_event) { create(:webhook_event, created_at: 8.days.ago) }
    let!(:old_event2) { create(:webhook_event, created_at: 9.days.ago) }
    let!(:event1) { create(:webhook_event, created_at: 3.days.ago) }
    let!(:event2) { create(:webhook_event, created_at: 3.days.ago) }

    it 'destroys only old events' do
      expect { perform }.to change(WebhookEvent, :count).by(-2)
      expect(WebhookEvent.where(id: [old_event.id, old_event2.id])).not_to be_exist
    end
  end
end
