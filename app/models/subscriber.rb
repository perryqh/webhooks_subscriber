# frozen_string_literal: true

class Subscriber < ApplicationRecord
  has_many :webhook_events, dependent: :destroy
  belongs_to :user

  validates :name, presence: true

  def last_webhook_event
    webhook_events.order(:created_at).last
  end
end
