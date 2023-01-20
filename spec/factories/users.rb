# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence :email do |n|
      "email#{n}@example.com"
    end
    password { 'test1234' }
    password_confirmation { 'test1234' }
  end
end
