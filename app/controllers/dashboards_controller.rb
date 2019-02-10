class DashboardsController < ApplicationController
  before_action :require_login
  before_action :set_user

  private
  def set_user
    # @user = User.find(params[:user_id])
    @user = current_user
  end
end
