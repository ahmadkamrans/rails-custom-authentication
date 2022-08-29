class User < ApplicationRecord
  has_secure_password
  
  before_save :email_to_lowercase
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true, uniqueness: true

  protected
  def email_to_lowercase
    self.email = email.downcase
  end
end
