require "application_system_test_case"

class CuriosityCardsTest < ApplicationSystemTestCase
  test "visiting the index" do
    create(:user)
    create_list(:curiosity_card, 4, title: 'My title')
    create(:comment, message: 'My first comment')

    visit curiosity_cards_url

    assert_selector "div.card", text: "My title", count: 4
    # assert_selector "div.fa-check", count: 5
  end
end
