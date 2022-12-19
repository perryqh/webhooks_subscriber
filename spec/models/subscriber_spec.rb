# frozen_string_literal: true

RSpec.describe Subscriber, type: :model do
  it { is_expected.to have_many :webhook_events }
  it { is_expected.to validate_presence_of :name }
end
