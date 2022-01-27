# frozen_string_literal: true

require 'test_helper'

class StatementTest < ActiveSupport::TestCase
  def curiosity
    @curiosity ||= create(:curiosity_card)
  end

  def user
    @user ||= create(:user)
  end

  setup do
    @statement = create(:statement,
                        user: user,
                        curiosity_card: curiosity,
                        is_real: true)
  end

  test 'should exit only one register by action' do
    reaction_again = build_stubbed(:statement,
                                   user: user,
                                   curiosity_card: curiosity,
                                   is_real: true)

    assert_not reaction_again.valid?
  end

  test 'should update the statement to true' do
    @statement.is_real = true

    assert @statement.valid?
  end

  test 'should update the statement to false' do
    @statement.is_real = false

    assert @statement.valid?
  end

  test 'should not allow nil values' do
    @statement.is_real = nil

    assert_not @statement.valid?
  end
end
