# frozen_string_literal: true

class WebhookEvent < ApplicationRecord
  after_create_commit :stream

  belongs_to :subscriber

  private

  def stream
    broadcast_prepend_later_to(subscriber,
                               :webhook_events,
                               target: :webhook_events,
                               locals: { highlight: true })
  end
end
