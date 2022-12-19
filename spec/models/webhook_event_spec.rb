# frozen_string_literal: true

RSpec.describe WebhookEvent, type: :model do
  it { is_expected.to belong_to :subscriber }
end
