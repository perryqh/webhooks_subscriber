# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    redirect_to subscribers_path if signed_in?
  end
end
