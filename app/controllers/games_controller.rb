# frozen_string_literal: true

class GamesController < ApplicationController
  before_action :authenticate_user!

  def index
    @game = Game.create_game(current_user)
  end

  def show
    @questions = CuriosityCard.set_questions(params[:game_id], params[:id])
    redirect_to question_path(params[:game_id])
  end

  def update
    question = Question.find(params[:id])
    Question.answer_question(question, params[:is_real])

    @answer = question.curiosity_card
    resp = @answer.truthful ? :success : :danger
    flash[resp] = @answer.extra_comment
    redirect_back(fallback_location: root_path)
  end
end
