# frozen_string_literal: true

require 'test_helper'

class CommentPolicyTest < ActiveSupport::TestCase
  test 'should update its own comment' do
    user = create(:user)
    comment = create(:comment, user:)
    create(:curiosity_card, user:)

    assert_permit user, comment, :update
  end

  test 'should not update others comments' do
    user = create(:user)
    comment = create(:comment)
    create(:curiosity_card)

    refute_permit user, comment, :update
  end

  test 'should delete its own comment' do
    user = create(:user)
    comment = create(:comment, user:)
    create(:curiosity_card, user:)

    assert_permit user, comment, :destroy
  end

  test 'should not delete others comments' do
    user = create(:user)
    comment = create(:comment)
    create(:curiosity_card)

    refute_permit user, comment, :destroy
  end
end
