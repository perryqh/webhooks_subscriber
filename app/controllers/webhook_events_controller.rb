# frozen_string_literal: true

class WebhookEventsController < ApplicationController
  before_action :authenticate_user!

  layout 'application'

  def destroy
    @subscriber = Subscriber.find_by!(id: params[:subscriber_id])
    @subscriber.webhook_events.destroy_all
    redirect_to subscriber_path(@subscriber)
  end
end
