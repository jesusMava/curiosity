# frozen_string_literal: true

require 'application_system_test_case'

class GamesTest < ApplicationSystemTestCase
  def user
    @user ||= create(:user)
  end

  setup do
    user
  end

  test 'visiting the index game' do
    sign_in user

    visit games_path

    assert_selector 'h1', text: 'Curiosity Game'
  end

  test 'Top 10 players' do
    sign_in user

    visit games_path

    assert_selector 'h2', text: 'Top 10 players'
  end

  test 'should create game' do
    sign_in user

    visit games_path
    click_on 'Start a new game'
    click_on 'Create Game'

    assert_text 'Game was successfully created.'
    assert_selector 'h2', text: 'Total score: 0'
  end

  test 'should play a game' do
    sign_in user
    game = create(:game, user: user)
    create_list(:question, 5, game: game, answer: nil)

    visit game_path(game)

    assert_selector 'h2', text: 'Total score: 0'
    click_on 'Real'
    assert_selector 'h2', text: 'Total score: 20'
    click_on 'Real'
    assert_selector 'h2', text: 'Total score: 40'
    click_on 'Fake'
    assert_selector 'h2', text: 'Total score: 40'
    click_on 'Fake'
    assert_selector 'h2', text: 'Total score: 40'
    click_on 'Real'
    assert_selector 'h2', text: 'Total score: 60'
    assert_selector 'h1', text: 'Game over!!'
    assert_link('Play again')
  end
end
