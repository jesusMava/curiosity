# frozen_string_literal: true

class GamesController < ApplicationController
  before_action :authenticate_user!

  def index
    authorize(Game)
  end

  def show
    @game = authorize(Game.find(params[:id]))
  end

  def new
    @game = authorize(Game.new)
  end

  def create
    @game = authorize(Game.new(game_params))
    @game.user = current_use

    if @game.save
      redirect_to game_url(@game), notice: 'Game was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def game_params
    params.require(:game).permit(:category_id)
  end
end
