class CuriosityCardsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_curiosity, only: [:show, :edit]
  before_action :find_curiosity_scope_by_current_user, only: [:update, :destroy]

  def index
    @curiosities = CuriosityCard.order('created_at DESC').page(params[:page]).per(12)
  end

  def show
    respond_to do |format|
      format.html { render :show }
      format.pdf do
        pdf = ExportPdf.new(@curiosity)
        send_data pdf.render,
                  filename: "curiosity_#{@curiosity.title}.pdf",
                  type: 'application/pdf',
                  disposition: 'inline'
      end
    end
  end

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
      flash[:error] = 'Unable to do this actions'
      redirect_to root_path, status: :see_other
    end
  end
end
