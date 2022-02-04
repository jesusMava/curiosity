# frozen_string_literal: true

require 'test_helper'

class GameTest < ActiveSupport::TestCase
  def game
    @game ||= create(:game)
  end

  def category
    @category ||= create(:category)
  end

  def curiosities
    @curiosities ||= create_list(:curiosity_card, 5, category: category)
  end

  test 'should be a valid game' do
    game = build(:game)

    assert game.valid?
  end

  test 'should create a game' do
    game = build(:game)

    assert_difference 'Game.count', 1 do
      game.save
    end
  end

  test 'should update total_score' do
    curiosities.map do |curiosity|
      create(:question, game: game, curiosity_card: curiosity, score: 20)
    end

    game.update_total_score

    assert_equal 100, game.total_score
  end

  test 'should create quesions' do
    curiosities.map do |curiosity|
      create(:question, game: game, curiosity_card: curiosity, score: 0, answer: nil)
    end

    game.completed?

    assert_equal 5, game.questions.count
  end

  test 'should completed be true' do
    curiosities.map do |curiosity|
      create(:question, game: game, curiosity_card: curiosity, score: 20)
    end

    assert game.completed?
  end
end
