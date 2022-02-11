# frozen_string_literal: true

require 'application_system_test_case'

class CommentsTest < ApplicationSystemTestCase
  def curiosity
    @curiosity ||= create(:curiosity_card, content: 'simple content')
  end

  def user
    @user ||= create(:user)
  end

  setup do
    curiosity
    user
  end

  test 'Creating a comment' do
    sign_in user

    visit curiosity_card_path(curiosity)
    fill_in id: 'comment_message', with: 'This is my comment!'
    click_on 'Create Comment'

    assert_link('Edit')
    assert_link('Destroy')
  end

  test 'Deleting a comment' do
    sign_in user
    create(:comment, message: 'my comment', curiosity_card: curiosity, user: user)

    visit curiosity_card_path(curiosity)
    accept_alert do
      click_on 'Destroy'
    end

    assert_no_text('my comment')
  end

  test 'Editing a comment' do
    sign_in user
    create(:comment, message: 'my comment', curiosity_card: curiosity, user: user)

    visit curiosity_card_path(curiosity)
    click_on 'Edit'
    fill_in id: 'comment_message', with: 'My comment Edited'
    click_on 'Update Comment'

    assert_text('My comment Edited')
  end
end
