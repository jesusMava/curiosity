# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :set_game
  before_action :set_question, only: %i[edit update]

  def edit; end

  def update
    if @question.update(question_params)
      @game.update_total_score
      redirect_to game_url(@question.game), notice: 'Question was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_game
    @game = Game.find(params[:game_id])
  end

  def set_question
    @question = authorize(@game.questions.find(params[:id]))
  end

  def question_params
    params.require(:question).permit(:answer)
  end
end
