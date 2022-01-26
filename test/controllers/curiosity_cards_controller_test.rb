# frozen_string_literal: true

require 'test_helper'

class CuriosityCardsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get curiosity_cards_path

    assert_response :success
  end

  test 'should get show' do
    curiosity = create(:curiosity_card)

    get curiosity_cards_path(curiosity)

    assert_response :success
  end

  test 'should create' do
    sign_in create(:user)

    post curiosity_cards_path, params: {
      curiosity_card:
      {
        title: 'my title is nice',
        content: 'this content is nice too '
      }
    }

    assert_redirected_to curiosity_card_path(CuriosityCard.last)
  end

  test 'should not create a curiosity when there is not user' do
    post curiosity_cards_path

    assert_redirected_to new_user_session_path
  end

  test 'should edit a curiosity' do
    user = create(:user)
    curiosity = create(:curiosity_card, user: user)
    sign_in user

    patch curiosity_card_path(curiosity), params: {
      curiosity_card:
      {
        title: 'my title is nice hehe',
        content: 'this content is nice too hehe'
      }
    }

    assert_redirected_to curiosity_card_path(CuriosityCard.last)
  end

  test 'should render the form with errors' do
    user = create(:user)
    curiosity = create(:curiosity_card, user: user)
    sign_in user

    patch curiosity_card_path(curiosity), params: {
      curiosity_card:
      {
        title: 'my',
        content: 'the'
      }
    }

    assert_response :unprocessable_entity
  end

  test 'should not edit other post' do
    curiosity = create(:curiosity_card)
    sign_in create(:user)

    patch curiosity_card_path(curiosity), params: {
      curiosity_card:
      {
        title: 'my title is nice hehe',
        content: 'this content is nice too hehe'
      }
    }

    assert_redirected_to root_path
    assert_equal 'Unauthorized action', flash[:error]
  end

  test 'should not update a curiosity when there is not user' do
    curiosity = create(:curiosity_card)

    patch curiosity_card_path(curiosity)

    assert_redirected_to new_user_session_path
  end

  test 'should delete' do
    user = create(:user)
    curiosity = create(:curiosity_card, user: user)
    sign_in user

    delete curiosity_card_path(curiosity)

    assert_redirected_to root_path
    assert_response :see_other
  end

  test 'should not delete a curiosity when there is not user' do
    curiosity = create(:curiosity_card)

    delete curiosity_card_path(curiosity)

    assert_redirected_to new_user_session_path
  end
end
