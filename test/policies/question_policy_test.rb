# frozen_string_literal: true

require 'test_helper'

class QuestionPolicyTest < ActiveSupport::TestCase
  def user
    @user ||= build(:user)
  end

  def test_show
    assert_permit user, build(:question), :show
  end

  def test_update
    game = build(:game, user: user)
    question = build(:question, game: game)

    assert_permit user, question, :update
  end

  def test_create
    refute_permit user, build(:question), :create
  end

  def test_destroy
    refute_permit user, build(:question), :destroy
  end
end
