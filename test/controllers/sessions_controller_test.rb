require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @resource = User.create!(email: "user@example.com", password: "password", password_confirmation: "password")
  end

  test "should login successfully" do
    post login_path, params: {
      user: {
        email: @resource.email,
        password: @resource.password
      }
    }

    assert_redirected_to root_path
    assert_equal @resource, current_user
  end

  test "should redirect from root if not authenticated" do
    get root_path
    assert_redirected_to login_path
  end
end
