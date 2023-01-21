# frozen_string_literal: true

require 'sidekiq/web'
require 'sidekiq/cron/web'

Rails.application.routes.draw do
  authenticate :user do
    mount Sidekiq::Web => '/sidekiq'
  end

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  post '/api/webhook_events/:subscriber_id', to: 'api/webhook_events#create', as: 'webhooks_create',
                                             defaults: { format: :json }

  resources :subscribers, only: %i[new create show index destroy] do
    resources :webhook_events, only: :destroy
  end
  root 'home#index'
end
