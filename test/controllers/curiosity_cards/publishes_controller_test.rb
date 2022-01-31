# frozen_string_literal: true

require 'test_helper'

module CuriosityCards
  class PublishesControllerTest < ActionDispatch::IntegrationTest
    def user
      @user ||= create(:user, role: :admin)
    end

    setup do
      @curiosity = create(:curiosity_card)
      sign_in(user)
    end

    test 'should get update' do
      patch curiosity_card_publish_url(@curiosity)
      assert_redirected_to @curiosity
    end

    test 'should get destroy' do
      delete curiosity_card_unpublish_url(@curiosity)
      assert_redirected_to @curiosity
    end
  end
end
