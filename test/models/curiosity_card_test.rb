# frozen_string_literal: true

require 'test_helper'

class CuriosityCardTest < ActiveSupport::TestCase
  test 'invalid content and title' do
    curiosity = build(:curiosity_card, title: '   ', content: '')

    assert_not curiosity.valid?
  end

  test 'nil user' do
    curiosity = build(:curiosity_card, user_id: nil)

    assert_not curiosity.valid?
  end

  test 'valid instance content and title' do
    curiosity = build(:curiosity_card)

    assert curiosity.valid?
  end

  test 'create valid curiosity_card' do
    curiosity = build(:curiosity_card)

    assert_difference 'CuriosityCard.count', 1 do
      curiosity.save
    end
  end

  context 'should not access text or pdf' do
    should validate_content_type_of(:images).rejecting('text/plain', 'text/xml')
  end

  # Active storage
  # DEPRECATION WARNING: image/jpg is not a valid content type,
  context 'should access only images' do
    should validate_content_type_of(:images).rejecting('image/jpg', 'image/jpeg', 'image/png')
  end
end
