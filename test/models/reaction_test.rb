# frozen_string_literal: true

require 'test_helper'

class ReactionTest < ActiveSupport::TestCase
  def curiosity
    @curiosity ||= create(:curiosity_card)
  end

  def user
    @user ||= create(:user)
  end

  setup do
    @reaction = create(:reaction, user: user, curiosity_card: curiosity)
  end

  test 'should exit only one register by action' do
    reaction_again = build_stubbed(:reaction, user: user, curiosity_card: curiosity)
    assert_not reaction_again.valid?
  end

  test 'should update the reaction to true' do
    @reaction.statement = true
    assert @reaction.valid?
  end

  test 'should update the reaction to false' do
    @reaction.statement = false
    assert @reaction.valid?
  end
end
