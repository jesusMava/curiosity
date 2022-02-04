# frozen_string_literal: true

require 'test_helper'

class GamePolicyTest < ActiveSupport::TestCase
  def user
    @user ||= build(:user)
  end

  def test_show
    assert_permit user, build(:game), :show
  end

  def test_create
    assert_permit user, Game.new, :create
  end

  def test_update
    refute_permit user, build(:game), :update
  end

  def test_destroy
    refute_permit user, build(:game), :destroy
  end
end
