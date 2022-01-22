require "test_helper"

class CommentTest < ActiveSupport::TestCase
  test 'should not be valid' do
    message = build(:comment, message: ' ')

    assert_not message.valid?
  end

  test 'should not a valid message with a shorter that 4 characters' do
    message = build(:comment, message: 'the')

    assert_not message.valid?
  end

  test 'should not be valid without user' do
    message = build(:comment, message: ' ', user: nil)

    assert_not message.valid?
  end

  test 'should be valid' do
    message = build(:comment)

    assert message.valid?
  end

  test 'should be a valid message' do
    message = build(:comment, message: 'hello')

    assert message.valid?
  end

  test 'should not be a valid message with more that 250 characters' do
    text = 'a' * 256
    message = build(:comment, message: text)

    assert_not message.valid?
  end
end
