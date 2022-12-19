# frozen_string_literal: true

class Subscriber < ApplicationRecord
  has_many :webhook_events

  validates :name, presence: true
end
