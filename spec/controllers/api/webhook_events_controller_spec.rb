# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::WebhookEventsController, type: :controller do
  let(:parsed_json) { JSON.parse(response.body).symbolize_keys }

  describe 'POST create' do
    subject(:poster) do
      post :create, params:, format: :json
    end

    let(:subscriber) { create(:subscriber) }
    let(:subscriber_id) { subscriber.id }
    let(:event_type) { 'company.form.updated' }
    let(:params) do
      {
        subscriber_id:,
        event_type:,
        resource_type: 'Company',
        resource_id: '7756341741171842',
        resource_uuid: '5df911a0-e8e9-412d-8aaf-a46ad193dd96',
        entity_type: 'Form',
        entity_id: '7757842011281647',
        entity_uuid: 'c02f2c32-34f7-4128-9145-7d49f0c3f355',
        timestamp: '1671058841',
        references: {
          company_uuid: '5df911a0-e8e9-412d-8aaf-a46ad193dd96'
        }
      }
    end

    it 'responds with 201' do
      expect(poster.status).to eq(201)
    end

    it 'creates a webhook-event' do
      expect { poster }.to change(WebhookEvent, :count).by(1)
    end

    it 'extracts the event_type' do
      poster
      expect(WebhookEvent.last.payload)
        .to eq(params.except(:subscriber_id).deep_stringify_keys)
    end

    it 'records remote_ip' do
      poster
      expect(WebhookEvent.last.remote_ip)
        .to eq('0.0.0.0')
    end
  end
end
