class CuriosityCardsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  # skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_curiosity, only: [:show, :edit]
  before_action :find_curiosity_scope_by_current_user, only: [:update, :destroy]

  def index
    @curiosities = CuriosityCard.all
  end

  def show; end

  def new
    @curiosity = CuriosityCard.new
  end

  def create
    @curiosity = current_user.curiosity_cards.new(curiosity_cards_params)

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

  def find_curiosity
    @curiosity = CuriosityCard.find(params[:id])
  end

  def find_curiosity_scope_by_current_user
    @curiosity = current_user.curiosity_cards.find_by(id: params[:id])

    unless @curiosity
      flash[:error] = 'Unable to do this acctions'
      redirect_to root_path, status: :see_other
    end
  end
end
