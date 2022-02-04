# frozen_string_literal: true

require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  test 'should be a correct answer' do
    question = build(:question)

    assert question.correct?
  end

  test 'should be a incorrect answer' do
    question = build(:question, answer: false)

    assert_not question.correct?
  end
end
