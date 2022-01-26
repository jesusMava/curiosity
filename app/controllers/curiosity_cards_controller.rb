# frozen_string_literal: true

class CuriosityCardsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_curiosity, only: %i[show edit update destroy]

  def index
    @curiosities = CuriosityCard.all
  end

  def show; end

  def new
    @curiosity = authorize(CuriosityCard.new)
  end

  def create
    @curiosity = authorize(current_user.curiosity_cards.new(curiosity_cards_params))

    if @curiosity.save
      redirect_to @curiosity
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @curiosity.update(curiosity_cards_params)
      redirect_to @curiosity
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @curiosity.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def curiosity_cards_params
    params.require(:curiosity_card).permit(:title, :content, images: [])
  end

  def set_curiosity
    @curiosity = authorize(CuriosityCard.find(params[:id]))
  end
end
