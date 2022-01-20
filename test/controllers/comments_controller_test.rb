require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  test 'should create a comment' do
    sign_in create(:user)
    curiosity = create(:curiosity_card)
    post curiosity_card_comments_path(curiosity), params: {
      comment: { message: 'my opinion is nice' }
    }
    assert_redirected_to curiosity_card_path(curiosity)
  end

  test 'should redirect to edit a comment' do
    sign_in create(:user)
    curiosity = create(:curiosity_card)
    post curiosity_card_comments_path(curiosity), params: {
      comment: { message: 'my' }
    }
    assert_response :unprocessable_entity
  end

  test 'should not be able to create a comment without login' do
    curiosity = create(:curiosity_card)
    post curiosity_card_comments_path(curiosity), params: {
      comment: { message: 'my opinion is nice' }
    }
    assert_redirected_to new_user_session_path
  end

  test 'user should be able to edit their own comments' do
    user = create(:user)
    curiosity = create(:curiosity_card)
    comment = create(:comment, curiosity_card: curiosity, user: )

    sign_in user

    patch curiosity_card_comment_path(curiosity, comment), params: {
      comment: { message: 'my opinion is nice too' }
    }

    assert_redirected_to curiosity_card_path(curiosity)
  end

  test 'should render edit by model validates' do
    user = create(:user)
    curiosity = create(:curiosity_card)
    comment = create(:comment, curiosity_card: curiosity, user: )

    sign_in user

    patch curiosity_card_comment_path(curiosity, comment), params: {
      comment: { message: 'my' }
    }

    assert_response :unprocessable_entity
  end

  test 'user should not be able to edit other comments' do
    user = create(:user)
    curiosity = create(:curiosity_card)
    comment = create(:comment, curiosity_card: curiosity)

    sign_in user

    patch curiosity_card_comment_path(curiosity, comment), params: {
      comment: { message: 'nice' }
    }

    assert_redirected_to curiosity_card_path(curiosity)
    assert_equal 'Unable to do this actions', flash[:error]
  end

  test 'user should not be able to destroy other comments' do
    user = create(:user)
    curiosity = create(:curiosity_card)
    comment = create(:comment, curiosity_card: curiosity)

    sign_in user

    delete curiosity_card_comment_path(curiosity, comment.id)

    assert_redirected_to curiosity_card_path(curiosity)
    assert_equal 'Unable to do this actions', flash[:error]
  end
end
