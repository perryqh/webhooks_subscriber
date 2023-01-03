# frozen_string_literal: true

module Api
  # API to create webhook-events
  class WebhookEventsController < ActionController::Base
    protect_from_forgery with: :null_session

    def create
      subscriber.webhook_events.create(webhook_event_params)
      render json: {}, status: 201
    end

    private

    def webhook_event_params
      { payload:,
        remote_ip: request.remote_ip }
    end

    def payload
      params.except(:subscriber_id,
                    :action,
                    :format,
                    :controller,
                    :webhook_event)
    end

    def subscriber
      @subscriber ||= Subscriber.find_by!(id: params[:subscriber_id])
    end
  end
end
