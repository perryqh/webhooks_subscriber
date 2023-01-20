# frozen_string_literal: true

# Creates subscribers to receive requests
class SubscribersController < ApplicationController
  before_action :authenticate_user!
  before_action :load_subscriber, only: %i[show destroy]

  layout 'application'

  def new
    @subscriber = Subscriber.new
  end

  def index
    @subscriber = Subscriber.new
    @subscribers = current_user.subscribers
  end

  def create
    @subscriber = current_user.subscribers.build(subscriber_params)
    if @subscriber.save
      flash[:notice] = 'Successfully created Subscriber!'
      redirect_to subscriber_path(@subscriber)
    else
      render :new
    end
  end

  def show; end

  def destroy
    @subscriber.destroy!
    redirect_to subscribers_path
  end

  private

  def subscriber_params
    params.require(:subscriber).permit(:name)
  end

  def load_subscriber
    @subscriber = Subscriber.find_by!(id: params[:id])
  end
end
