# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: %i[edit update destroy]
  before_action :set_curiosity_card, only: %i[edit create update destroy]

  def create
    @comment = authorize(@curiosity.comments.new(comment_params))

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

  def set_comment
    @comment = authorize(Comment.find(params[:id]))
  end

  def set_curiosity_card
    @curiosity = CuriosityCard.find(params[:curiosity_card_id])
  end
end
