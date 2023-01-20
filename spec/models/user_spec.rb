# frozen_string_literal: true
RSpec.describe User, type: :model do
  it { is_expected.to have_many(:subscribers).dependent(:destroy) }
end
