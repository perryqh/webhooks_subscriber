# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WebhookEventsController, type: :controller do
  describe 'DELETE destroy' do
    subject(:delete_all_events) { delete :destroy, params: { subscriber_id:, id: :ignored } }

    let(:subscriber_id) { subscriber.id }
    let(:subscriber) { webhook_event.subscriber }
    let!(:webhook_event) do
      create(:webhook_event)
    end

    it 'redirects to ' do
      expect(delete_all_events).to redirect_to(subscriber_url(id: subscriber_id))
    end

    it 'assigns subscriber' do
      expect { delete_all_events }.to change(WebhookEvent, :count).by(-1)
      expect(WebhookEvent.find_by(id: webhook_event.id)).to be_nil
    end
  end
end
