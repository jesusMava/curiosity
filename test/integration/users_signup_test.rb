require "test_helper"

class UsersSignupTest < ActionDispatch::IntegrationTest
  test 'sign up' do
    get new_user_registration_path

    assert_select 'label', 'Email'
    assert_select 'label', 'Password'
    assert_select 'label', 'Password confirmation'
    assert_select 'div.card'
    assert_select 'a[href=?]', new_user_session_path, count: 2
  end

  test "invalid signup information" do
    get new_user_registration_path

    assert_no_difference 'User.count' do
      post user_session_path, params: {
        user: {
          name: "",
          email: "user@invalid",
          password: "foo",
          password_confirmation: "bar"
        }
      }
    end

    assert_equal 'Invalid Email or password.', flash[:alert]
  end

  test "valid signup information" do
    get new_user_registration_path

    assert_difference 'User.count', 1 do
      post user_registration_path, params: {
        user: {
          email: "user@invalid.com",
          password: "thisIsMyPassword",
          password_confirmation: "thisIsMyPassword"
        }
      }
    end

    follow_redirect!
    assert_equal 'Welcome! You have signed up successfully.', flash[:notice]
  end

  test "valid login" do
    user = create(:user)
    get new_user_registration_path

    post user_session_path, params: {
      user: {
        email: user.email,
        password: user.password
      }
    }

    follow_redirect!
    assert_equal 'Signed in successfully.', flash[:notice]
  end
end
