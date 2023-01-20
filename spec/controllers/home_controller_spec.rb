# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'GET index' do
    subject(:get_index) { get :index }

    context 'when signed in' do
      let(:user) { create(:user) }

      before { sign_in(user) }

      it 'redirects to subscribers page' do
        expect(get_index).to redirect_to(subscribers_url)
      end
    end

    context 'when not signed in' do
      it 'renders index' do
        expect(get_index).to render_template(:index)
      end
    end
  end
end
