# frozen_string_literal: true

# Stores requests made to webhook_events#create
class WebhookEvent < ApplicationRecord
  after_create_commit :stream

  belongs_to :subscriber, counter_cache: true

  private

  def stream
    broadcast_prepend_to(subscriber,
                         :webhook_events,
                         target: :webhook_events,
                         locals: { highlight: true })
  end
end
