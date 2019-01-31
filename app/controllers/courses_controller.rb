class CoursesController < ApplicationController
  before_action :require_login

  def index
    @courses = Course.all
  end

end
