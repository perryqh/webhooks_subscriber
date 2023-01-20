# frozen_string_literal: true

require 'rails_helper'

describe DateHelper do
  describe '#local_date_time' do
    subject(:local) { helper.local_date_time(date_time) }

    context 'with date_time' do
      let(:date_time) { Time.current }

      it { is_expected.to be_present }
    end

    context 'with nil' do
      let(:date_time) { nil }

      it { is_expected.to be_nil }
    end
  end
end
