# frozen_string_literal: true

class QuestionsController < ApplicationController
  def show
    @questions = Kaminari.paginate_array(Question.take_questions(params[:id])).page(params[:page]).per(1)

    return @questions unless @questions.empty?

    @result = Game.update_total_score(params[:id])
    render 'result'
  end
end
