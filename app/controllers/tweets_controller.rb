class TweetsController < ApplicationController
  def index
    @tweets ||= begin
      if params[:offset].present?
        Tweet.order(:created_at, :desc).offset(params[:offset]).first(10)
      else
        Tweet.limit(10)
      end
    end

    render json: @tweets
  end
end
