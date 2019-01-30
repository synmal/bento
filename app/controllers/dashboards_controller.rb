class DashboardsController < ApplicationController
  before_action :require_login
  before_action :set_user

  def show
    @url = 'https://medium.freecodecamp.org/feed?fbclid=IwAR32766uTBd3WhMZrcskT1bLI1S1STDpzbhJllPOOTQTOhPZEkqGe53UHqs'
  end

  private
  def set_user
    @user = User.find(params[:user_id])
  end
end
