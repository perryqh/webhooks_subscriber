# frozen_string_literal: true

RSpec.describe Subscriber, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:webhook_events).dependent(:destroy) }
  it { is_expected.to validate_presence_of :name }
end
