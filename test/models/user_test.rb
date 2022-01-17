require "test_helper"

class UserTest < ActiveSupport::TestCase
  test 'should be valid' do
    user = build(:user)
    assert user.valid?
    assert user.save
  end

  test 'should not be a password valid' do
    user = build(:user, password: '123')
    assert_not user.valid?
    assert_not user.save, 'Password should have at least 6 characters'
  end

  test 'should not be a email valid' do
    user = build(:user, email: 'my_email.cm')
    assert_not user.valid?
    assert_not user.save, 'Email should be valid example@domine.extention'
  end
end
