# frozen_string_literal: true

module Api
  class WebhookEventsController < ActionController::Base
    protect_from_forgery with: :null_session

    def create
      subscriber.webhook_events.create(webhook_event_params)
      render json: {}, status: 201
    end

    private

    def webhook_event_params
      { payload: }
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
