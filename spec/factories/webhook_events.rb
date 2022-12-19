# frozen_string_literal: true

FactoryBot.define do
  factory :webhook_event do
    subscriber
    payload do
      {
        'event_type' => 'form.signed',
        'resource_type' => 'Company',
        'resource_id' => 3,
        'resource_uuid' => SecureRandom.hex(10),
        'entity_type' => 'Form',
        'entity_id' => 23,
        'entity_uuid' => SecureRandom.hex(10),
        'timestamp' => Time.current.to_i
      }
    end
  end
end
