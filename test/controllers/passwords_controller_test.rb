require "test_helper"

class PasswordsControllerTest < ActionDispatch::IntegrationTest

  test "should send reset password instructions" do
    resource =  User.create!(email: "confirmed_user@example.com", password: "password", password_confirmation: "password")
    assert_emails 1 do
      post passwords_path, params: {
        user: {
          email: resource.email
        }
      }
    end

    assert_redirected_to login_path
    assert_equal "Reset Instructions has been sent to user", flash[:notice]
  end
end
