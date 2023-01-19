# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  post '/api/webhook_events/:subscriber_id', to: 'api/webhook_events#create', as: 'webhooks_create',
                                             defaults: { format: :json }

  resources :subscribers, only: %i[new create show] do
    resources :webhook_events, only: :destroy
  end
  root 'subscribers#new'
end
