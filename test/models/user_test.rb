require "test_helper"

class UserTest < ActiveSupport::TestCase
  include ActionMailer::TestHelper

  setup do
    @resource = User.new(email: "user@example.com", password: "password", password_confirmation: "password")
  end

  test "should be valid" do
    assert @resource.valid?
  end

  test "email should be unique" do
    @resource.save!
    @resource2 = User.new(email: @resource.email)

    assert_not @resource2.valid?
  end

  test "should not save with invalid email" do
    resource = User.new(email: "user", password: "password", password_confirmation: "password")
    assert_not resource.save
  end

  test "should send reset email when forgot password" do
    @resource.save!

    assert_emails 1 do
      @resource.send_reset_password_instructions!
    end
  end
end
