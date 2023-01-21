# frozen_string_literal: true

class DestroyOldEventsJob < ApplicationJob
  DELETE_EVENTS_OLDER_THAN_IN_DAYS = 7

  def perform
    WebhookEvent
      .where('created_at < :upper_limit', upper_limit: DELETE_EVENTS_OLDER_THAN_IN_DAYS.days.ago)
      .find_each(&:destroy)
  end
end
