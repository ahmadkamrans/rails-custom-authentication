class UserMailer < ApplicationMailer

  def password_reset(user, password_reset_token)
    @user = user
    @password_reset_token = password_reset_token

    mail to: @user.email, subject: "Reset Password"
  end
end
