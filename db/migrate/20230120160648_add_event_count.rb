# frozen_string_literal: true

class AddEventCount < ActiveRecord::Migration[7.0]
  def change
    add_column :subscribers, :webhook_events_count, :integer, default: 0
  end
end
