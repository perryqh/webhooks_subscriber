# frozen_string_literal: true

class AddUserIdToSubscribers < ActiveRecord::Migration[7.0]
  def change
    change_table :subscribers do |t|
      t.references :user, type: :uuid
    end
  end
end
