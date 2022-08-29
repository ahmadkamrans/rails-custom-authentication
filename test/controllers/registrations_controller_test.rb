require "test_helper"

class RegistrationsControllerTest < ActionDispatch::IntegrationTest

  test "should create user successfully" do
    assert_difference("User.count", 1) do
      post sign_up_path, params: {
        user: {
          email: "user@example.com",
          password: "password",
          password_confirmation: "password"
        }
      }
    end

    assert_redirected_to login_path
  end
end
