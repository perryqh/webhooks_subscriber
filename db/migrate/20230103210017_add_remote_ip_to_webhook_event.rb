# frozen_string_literal: true

class AddRemoteIpToWebhookEvent < ActiveRecord::Migration[7.0]
  def change
    add_column :webhook_events, :remote_ip, :string
  end
end
