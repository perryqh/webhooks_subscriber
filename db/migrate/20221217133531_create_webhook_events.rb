# frozen_string_literal: true

class CreateWebhookEvents < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto'
    create_table :subscribers, id: :uuid do |t|
      t.string :name, null: false
      t.timestamps
    end

    add_index :subscribers, :name

    create_table :webhook_events, id: :uuid do |t|
      t.references :subscriber, type: :uuid
      t.jsonb :payload
      t.timestamps
    end
  end
end
