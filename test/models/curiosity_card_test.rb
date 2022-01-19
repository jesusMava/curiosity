require "test_helper"

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
end
