# frozen_string_literal: true

require 'test_helper'

class GamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in create(:user)
  end

  test 'should get index' do
    get games_path
    assert_response :success
  end

  test 'should get new' do
    get new_game_url
    assert_response :success
  end

  test 'should create game' do
    category = create(:category)

    assert_difference('Game.count', 1) do
      post games_url, params: { game: { category_id: category.id } }
    end

    assert_redirected_to game_url(Game.last)
  end

  test 'should show game' do
    game = create(:game)

    get game_url(game)

    assert_response :success
  end
end
