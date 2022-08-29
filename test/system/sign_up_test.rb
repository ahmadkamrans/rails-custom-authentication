require "application_system_test_case"

class SignUpTest < ApplicationSystemTestCase

  test "should sign up with new user" do
    visit sign_up_path

    fill_in "Email", with: 'test@valid.com'
    fill_in "Password", with: 'password'
    fill_in "Password confirmation", with: 'password'
    click_on "Sign Up"

    assert_text "User created successfully. Please login to continue."
  end

  test "should not sign up with existing user" do
    resource = User.create!(email: "user@example.com", password: "password", password_confirmation: "password")
    visit sign_up_path

    fill_in "Email", with: resource.email
    fill_in "Password", with: 'password'
    fill_in "Password confirmation", with: 'password'
    click_on "Sign Up"

    assert_text "Email has already been taken"
  end

  test "should not sign up if passwords do not match" do
    visit sign_up_path

    fill_in "Email", with: 'test@valid.com'
    fill_in "Password", with: 'password'
    fill_in "Password confirmation", with: 'password1'
    click_on "Sign Up"

    assert_text "Password confirmation doesn't match Password"
  end
end
