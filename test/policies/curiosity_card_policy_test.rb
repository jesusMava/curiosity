# frozen_string_literal: true

require 'test_helper'

class CuriosityCardPolicyTest < ActiveSupport::TestCase
  def user
    @user ||= build(:user)
  end

  test 'should show a curiosity_card' do
    assert_permit user, build(:curiosity_card), :show
  end

  test 'should create a curiosity_card' do
    assert_permit user, CuriosityCard.new, :create
  end

  test 'should update its own curiosity_card' do
    curiosity_card = build(:curiosity_card, user: user)
    assert_permit user, curiosity_card, :update
  end

  test 'should not update others comments' do
    curiosity_card = build(:curiosity_card)
    refute_permit user, curiosity_card, :update
  end

  test 'should delete its own curiosity' do
    curiosity_card = build(:curiosity_card, user: user)
    assert_permit user, curiosity_card, :destroy
  end

  test 'should not delete others comments' do
    curiosity_card = build(:curiosity_card)
    refute_permit user, curiosity_card, :destroy
  end
end
