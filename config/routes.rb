# frozen_string_literal: true

Rails.application.routes.draw do
  post '/api/webhook_events/:subscriber_id', to: 'api/webhook_events#create', as: 'webhooks_create',
                                             defaults: { format: :json }

  resources :subscribers, only: %i[new create show]
  root 'subscribers#new'
end
