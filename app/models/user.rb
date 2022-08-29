class User < ApplicationRecord
  has_secure_password
  
  PASSWORD_RESET_TOKEN_TIME = 10.minutes
  
  before_save :email_to_lowercase
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true, uniqueness: true

  def generate_reset_token
    signed_id expires_in: PASSWORD_RESET_TOKEN_TIME
  end

  def send_reset_password_instructions!
    reset_token = generate_reset_token
    UserMailer.password_reset(self, reset_token).deliver_now #deliver_now for local
  end

  protected
  def email_to_lowercase
    self.email = email.downcase
  end
end
