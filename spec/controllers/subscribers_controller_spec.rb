# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SubscribersController, type: :controller do
  let(:user) { create(:user) }

  describe 'GET new' do
    subject(:get_new) { get :new }

    context 'when not signed in' do
      it 'redirects to sign-in page' do
        expect(get_new).to redirect_to(new_user_session_url)
      end
    end

    context 'when signed in' do
      before { sign_in(user) }

      it 'renders new template' do
        expect(get_new).to render_template(:new)
      end

      it 'assigns a subscriber' do
        get_new
        expect(assigns(:subscriber)).to be_present
      end
    end
  end

  describe 'GET show' do
    subject(:get_show) { get :show, params: { id: subscriber_id } }

    before { sign_in(user) }

    let(:subscriber_id) { subscriber.id }
    let(:subscriber) { webhook_event.subscriber }
    let(:webhook_event) do
      create(:webhook_event)
    end

    it 'renders show template' do
      expect(get_show).to render_template(:show)
    end

    it 'assigns subscriber' do
      get_show
      expect(assigns(:subscriber)).to be_present
    end
  end

  describe 'GET index' do
    subject(:get_index) { get :index }

    before { sign_in(user) }

    let!(:subscriber) { webhook_event.subscriber }
    let(:webhook_event) do
      create(:webhook_event)
    end
    let(:user) { subscriber.user }

    it 'renders index template' do
      expect(get_index).to render_template(:index)
    end

    it 'assigns subscribers' do
      get_index
      expect(assigns(:subscribers)).to eq([subscriber])
    end
  end

  describe 'POST create' do
    subject(:post_create) { post :create, params: { subscriber: { name: subscriber_name } } }

    before { sign_in(user) }

    let(:subscriber_name) { 'new subscription' }

    it 'redirects to show' do
      expect(post_create).to redirect_to(subscriber_url(id: assigns(:subscriber).id))
    end

    it 'creates a subscriber' do
      expect { post_create }.to change(Subscriber, :count).by(1)
    end
  end

  describe 'DELETE destroy' do
    subject(:delete_destroy) { delete :destroy, params: { id: subscriber.id } }

    let(:subscriber) { create(:subscriber, user:) }

    before { sign_in(user) }

    it 'redirects to index' do
      expect(delete_destroy).to redirect_to(subscribers_url)
    end

    it 'deletes the subscriber' do
      subscriber
      expect { delete_destroy }.to change(Subscriber, :count).by(-1)
      expect(Subscriber.where(id: subscriber.id)).not_to be_exists
    end
  end
end
