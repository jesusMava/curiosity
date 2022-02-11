# frozen_string_literal: true

require 'application_system_test_case'
# rubocop:disable Metrics/ClassLength
class CuriosityCardsTest < ApplicationSystemTestCase
  def curiosity
    @curiosity ||= create_list(:curiosity_card, 9, content: 'simple content')
  end

  def user
    @user ||= create(:user)
  end

  def category
    @category ||= create(:category, name: 'programming')
  end

  setup do
    curiosity
    category
    user
  end

  test 'visiting the index without log in' do
    visit curiosity_cards_url

    assert_selector 'p', text: 'Be curious. Read widely.'
    assert_link('Add New Curiosity')
    assert_link('Play')
    assert_link('Comments', count: 9)
    assert_button('Real', count: 9)
    assert_button('Fake', count: 9)
    assert_button('Delete vote', count: 9)
  end

  test 'visiting the index with login' do
    sign_in user

    visit curiosity_cards_url

    page.assert_no_text('Be curious. Read widely.')
    assert_no_button('Sign up')
    assert_link('Add New Curiosity')
    assert_link('Play')
    assert_link('Comments', count: 9)
    assert_button('Real', count: 9)
    assert_button('Fake', count: 9)
    assert_button('Delete vote', count: 9)
    assert_button('Search')
  end

  test 'Creating a new curiosity_card' do
    sign_in user

    visit new_curiosity_card_path
    fill_in id: 'curiosity_card_title', with: 'My Curiosity'
    fill_in id: 'curiosity_card_content', with: 'This is my content. oh yeah!'
    select 'programming', from: 'curiosity_card_category_id'
    find_button('Create Curiosity card').click

    assert_selector 'h2', text: 'My Curiosity'
    assert_selector 'div.block', text: 'This is my content. oh yeah!'
    assert_selector 'h2', text: 'Add New Comments'
    assert_link('Edit')
    assert_link('Destroy')
    assert_button('Create Comment')
    assert_button('Real', count: 1)
    assert_button('Fake', count: 1)
    assert_button('Delete vote', count: 1)
  end

  test 'Deleting a Curiosity' do
    sign_in user
    curiosity_card = create(:curiosity_card, user: user, content: 'simple content x2')

    visit curiosity_card_path(curiosity_card)

    assert_selector 'h2', text: curiosity_card.title
    accept_alert do
      click_link 'Destroy'
    end
    assert_selector 'label', text: 'Search for:'
  end

  test 'Editing a curiosity_card' do
    sign_in user
    curiosity = create(:curiosity_card, user: user)

    visit edit_curiosity_card_path(curiosity)
    fill_in id: 'curiosity_card_title', with: 'My Curiosity Edited'
    fill_in id: 'curiosity_card_content', with: 'This is my content edited. oh yeah!'
    select 'programming', from: 'curiosity_card_category_id'
    click_on 'Update Curiosity card'

    assert_selector 'h2', text: 'My Curiosity Edited'
    assert_selector 'div.block', text: 'This is my content edited. oh yeah!'
    assert_selector 'h2', text: 'Add New Comments'
    assert_link('Edit')
    assert_link('Destroy')
    assert_button('Create Comment')
    assert_button('Real', count: 1)
    assert_button('Fake', count: 1)
    assert_button('Delete vote', count: 1)
  end

  test 'Selecting real reaction' do
    sign_in user

    visit curiosity_card_path(CuriosityCard.first)

    click_on 'Real'
    assert_selector 'span.tag.is-primary', text: '1'
    assert_selector 'span.tag.is-danger', text: '0'
  end

  test 'Selecting Fake reaction' do
    sign_in user
    visit curiosity_card_path(CuriosityCard.first)

    click_on 'Fake'
    assert_selector 'span.tag.is-primary', text: '0'
    assert_selector 'span.tag.is-danger', text: '1'
  end

  test 'Deleting reaction' do
    sign_in user
    visit curiosity_card_path(CuriosityCard.first)

    click_on 'Fake'
    assert_selector 'span.tag.is-primary', text: '0'
    assert_selector 'span.tag.is-danger', text: '1'
    click_on 'Delete vote'
    assert_selector 'span.tag.is-primary', text: '0'
    assert_selector 'span.tag.is-danger', text: '0'
  end
end
# rubocop:enable Metrics/ClassLength
