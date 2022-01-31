# frozen_string_literal: true

require 'test_helper'

class CuriosityCardAdminControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    sign_in create(:user)
    get curiosity_card_admin_index_path
    assert_response :success
  end

  test 'should redirect to sign_in' do
    get curiosity_card_admin_index_path
    assert_redirected_to new_user_session_path
  end

  # test 'should post a curiosity' do
  #   create(:curiosity_card)
  #   get curiosity_card_admin_index_path
  #   assert_redirected_to new_user_session_path
  # end
end
