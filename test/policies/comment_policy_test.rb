# frozen_string_literal: true

require 'test_helper'

class CommentPolicyTest < ActiveSupport::TestCase
  def user
    @user ||= build(:user)
  end

  test 'should update its own comment' do
    comment = build(:comment, user: user)
    assert_permit user, comment, :update
  end

  test 'should not update others comments' do
    comment = build(:comment)
    refute_permit user, comment, :update
  end

  test 'should delete its own comment' do
    comment = build(:comment, user: user)
    assert_permit user, comment, :destroy
  end

  test 'should not delete others comments' do
    comment = build(:comment)
    refute_permit user, comment, :destroy
  end

  test 'should delete my comments' do
    comment = build(:comment, user: user)
    assert_permit user, comment, :destroy
  end
end
