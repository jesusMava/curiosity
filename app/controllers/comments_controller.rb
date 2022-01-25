class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_comment_and_curiosity, except: [:create]
  before_action :find_curiosity_card, only: [:create]

  def create
    @comment = @curiosity.comments.new(comment_params)
    authorize @comment

    if @comment.save
      redirect_to @curiosity
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @comment.update(comment_params)
      redirect_to curiosity_card_path(@curiosity)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy

    redirect_to curiosity_card_path(@curiosity), status: :see_other
  end

  private

  def comment_params
    params.require(:comment).permit(:message).merge(user_id: current_user.id)
  end

  def find_comment_and_curiosity
    @comment = Comment.find_by(id: params[:id])
    find_curiosity_card

    authorize @comment

    unless @comment
      flash[:error] = 'Unable to do this actions'
      redirect_to curiosity_card_path(@curiosity), status: :see_other
    end
  end

  def find_curiosity_card
    @curiosity = CuriosityCard.find(params[:curiosity_card_id])
  end
end
