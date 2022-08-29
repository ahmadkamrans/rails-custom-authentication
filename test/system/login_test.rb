require "application_system_test_case"

class LoginTest < ApplicationSystemTestCase

  test "should login with exisiting user" do
    resource = User.create!(email: "user@example.com", password: "password", password_confirmation: "password")
    visit login_path

    fill_in "Email", with: resource.email
    fill_in "Password", with: resource.password
    click_on "Sign In"

    assert_selector "h1", text: "Welcome"
  end
end
