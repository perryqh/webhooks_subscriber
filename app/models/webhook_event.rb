# frozen_string_literal: true

class WebhookEvent < ApplicationRecord
  belongs_to :subscriber
end
