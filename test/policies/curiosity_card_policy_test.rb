# frozen_string_literal: true

require 'test_helper'

class CuriosityCardPolicyTest < ActiveSupport::TestCase
  test 'should update its own curiosity_card' do
    user = create(:user)
    curiosity_card = create(:curiosity_card, user:)

    assert_permit user, curiosity_card, :update
  end

  test 'should not update others comments' do
    user = create(:user)
    curiosity_card = create(:curiosity_card)

    refute_permit user, curiosity_card, :update
  end

  test 'should delete its own curiosity' do
    user = create(:user)
    curiosity_card = create(:curiosity_card, user:)

    assert_permit user, curiosity_card, :destroy
  end

  test 'should not delete others comments' do
    user = create(:user)
    curiosity_card = create(:curiosity_card)

    refute_permit user, curiosity_card, :destroy
  end
end
