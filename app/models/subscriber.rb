# frozen_string_literal: true

class Subscriber < ApplicationRecord
  has_many :webhook_events, dependent: :destroy
  belongs_to :user

  validates :name, presence: true
end
