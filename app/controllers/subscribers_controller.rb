# frozen_string_literal: true

# Creates subscribers to receive requests
class SubscribersController < ApplicationController
  layout 'application'

  def new
    @subscriber = Subscriber.new
  end

  def create
    @subscriber = Subscriber.new(subscriber_params)
    if @subscriber.save
      flash[:notice] = 'Successfully created Subscriber!'
      redirect_to subscriber_path(@subscriber)
    else
      render :new
    end
  end

  def show
    @subscriber = Subscriber.find_by!(id: params[:id])
  end

  private

  def subscriber_params
    params.require(:subscriber).permit(:name)
  end
end
