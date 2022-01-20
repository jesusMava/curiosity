class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_by_comment_and_curiosity_by_user_scope, only: [:update, :destroy]
  before_action :find_curiosity_card, only: [:edit, :create]

  def create
    @comment = @curiosity.comments.new(comment_params)
    if @comment.save
      redirect_to @curiosity
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    if @comment.update(comment_params)
      redirect_to curiosity_card_path(@curiosity)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comment&.destroy

    redirect_to curiosity_card_path(@curiosity), status: :see_other
  end

  private

  def comment_params
    params.require(:comment).permit(:message).merge(user_id: current_user.id)
  end

  def find_by_comment_and_curiosity_by_user_scope
    @comment = current_user.comments.find_by(id: params[:id])
    find_curiosity_card
    unless @comment
      flash[:error] = 'Unable to do this actions'
      redirect_to curiosity_card_path(@curiosity)
    end
  end

  def find_curiosity_card
    @curiosity = CuriosityCard.find(params[:curiosity_card_id])
  end
end
