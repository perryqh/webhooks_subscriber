# frozen_string_literal: true

class AddUserIdToSubscribers < ActiveRecord::Migration[7.0]
  def change
    Subscriber.destroy_all

    change_table :subscribers do |t|
      t.references :user, type: :uuid
    end
  end
end
