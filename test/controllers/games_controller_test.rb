# frozen_string_literal: true

require 'test_helper'

class GamesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    sign_in create(:user)

    get games_path

    assert_response :success
  end
end
