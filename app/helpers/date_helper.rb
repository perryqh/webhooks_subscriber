# frozen_string_literal: true

module DateHelper
  def local_date_time(date_time)
    return if date_time.blank?

    local_time(date_time, format: '%Y-%m-%d %H:%M.%S %Z')
  end
end
