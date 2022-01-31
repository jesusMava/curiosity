require "test_helper"

class CuriosityCards::PublishesControllerTest < ActionDispatch::IntegrationTest
  def user
    @user ||= create(:user)
  end

  setup do
    @curiosity = create(:curiosity_card)
    sign_in(user)
  end

  # test "should get update" do
  #   patch curiosity_cards_publish_url(@curiosity)
  #   assert_response :success
  # end
  #
  # test "should get destroy" do
  #   delete curiosity_cards_unpublish_url(@curiosity)
  #   assert_response :see_other
  # end
end
