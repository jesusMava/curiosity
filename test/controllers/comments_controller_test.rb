# frozen_string_literal: true

require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  def user
    @user ||= create(:user)
  end

  def curiosity
    @curiosity ||= create(:curiosity_card)
  end

  setup do
    sign_in(user)
    curiosity
  end

  test 'should create a comment' do
    post curiosity_card_comments_path(curiosity), params: {
      comment: { message: 'my opinion is nice' }
    }

    assert_redirected_to curiosity_card_path(curiosity)
  end

  test 'should response with unprocessable_entity' do
    post curiosity_card_comments_path(curiosity), params: {
      comment: { message: 'my' }
    }

    assert_response :unprocessable_entity
  end

  test 'user should be able to edit their own comments' do
    comment = create(:comment, curiosity_card: curiosity, user:)

    patch curiosity_card_comment_path(curiosity, comment), params: {
      comment: { message: 'my opinion is nice too' }
    }

    assert_redirected_to curiosity_card_path(curiosity)
  end

  test 'user should be able to destroy comments' do
    comment = create(:comment, curiosity_card: curiosity, user:)
    assert_difference('Comment.count', -1) do
      delete curiosity_card_comment_path(curiosity, comment.id)
    end

    assert_redirected_to curiosity_card_path(curiosity)
  end
end
