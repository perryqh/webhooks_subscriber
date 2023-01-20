# frozen_string_literal: true

FactoryBot.define do
  factory :subscriber do
    sequence :name do |n|
      "name#{n}"
    end
    user
  end
end
