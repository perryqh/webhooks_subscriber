# frozen_string_literal: true

require 'rails_helper'

describe 'Routes', type: :routing do
  context 'when webhook event' do
    it 'creates with shallow route' do
      expect(post('/api/webhook_events/22')).to route_to(
        'format' => :json,
        'subscriber_id' => '22',
        'controller' => 'api/webhook_events',
        'action' => 'create'
      )
    end
  end

  context 'when subscribers' do
    it 'indexes' do
      expect(get('/subscribers/new')).to route_to(
        'controller' => 'subscribers',
        'action' => 'new'
      )
    end
  end

  context 'when subscriber webhook_event' do
    it 'destroys' do
      expect(delete('/subscribers/32/webhook_events/ignored')).to route_to(
        'controller' => 'webhook_events',
        'action' => 'destroy',
        'subscriber_id' => '32',
        'id' => 'ignored'
      )
    end
  end
end
