# frozen_string_literal: true

require 'test_helper'

class GameTest < ActiveSupport::TestCase
  def game
    @game ||= create(:game)
  end

  test 'should be a valid game' do
    game = build(:game)

    assert game.valid?
  end

  test 'should update total_score' do
    create_list(:question, 5, game: game, score: 20)

    game.update_total_score

    assert_equal 100, game.total_score
    assert game.completed?
  end

  test 'should create quesions' do
    create_list(:question, 5, game: game, score: 0, answer: nil)

    game.completed?

    assert_equal 5, game.questions.count
  end
end
