# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SubscribersController, type: :controller do
  describe 'GET new' do
    subject(:get_new) { get :new }

    it 'renders new template' do
      expect(get_new).to render_template(:new)
    end

    it 'assigns a subscriber' do
      get_new
      expect(assigns(:subscriber)).to be_present
    end
  end

  describe 'GET show' do
    subject(:get_show) { get :show, params: { id: subscriber_id } }

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
end
