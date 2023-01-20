# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WebhookEventsController, type: :controller do
  describe 'DELETE destroy' do
    subject(:delete_all_events) { delete :destroy, params: { subscriber_id:, id: :ignored } }

    before { sign_in(user) }

    let(:subscriber_id) { subscriber.id }
    let(:subscriber) { webhook_event.subscriber }
    let!(:webhook_event) do
      create(:webhook_event)
    end
    let(:user) { subscriber.user }

    it 'redirects to ' do
      expect(delete_all_events).to redirect_to(subscriber_url(id: subscriber_id))
    end

    it 'assigns subscriber' do
      expect { delete_all_events }.to change(WebhookEvent, :count).by(-1)
      expect(WebhookEvent.find_by(id: webhook_event.id)).to be_nil
    end

    context 'when webhook_event does not belong to the logged in user' do
      let(:user) { create(:user) }

      it 'responds with record not found' do
        expect { delete_all_events }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
