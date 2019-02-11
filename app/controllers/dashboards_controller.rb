class DashboardsController < ApplicationController
  before_action :require_login
  before_action :set_user

  def show
    @feeds = @user.feeds.order(created_at: :desc).page params[:page]
  end
  
  private
  def set_user
    @user = current_user
  end
end
