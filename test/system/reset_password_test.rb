require "application_system_test_case"

class ResetPasswordTest < ApplicationSystemTestCase
  include ActionMailer::TestHelper

  test "should receive reset password instructions with exisiting user" do
    resource = User.create!(email: "user@example.com", password: "password", password_confirmation: "password")
    visit new_password_path

    fill_in "Email", with: resource.email
    assert_emails 1 do
      click_on "Send Reset Password Instructions"
    end
  end


  test "should not send reset password instructions with non exisiting user" do
    visit new_password_path

    fill_in "Email", with: 'invalid@example.com'
    assert_emails 0 do
      click_on "Send Reset Password Instructions"
    end
  end
end
