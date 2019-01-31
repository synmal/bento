class PuzzlesController < ApplicationController
  before_action :require_login
  def index
    @puzzles = Puzzle.order(:id).page params[:page]
  end
end
