class Users::PasswordsController < ApplicationController
  view_accessor :resource

  before_action :redirect_logged_in_user, only: %i[create new]

  def new; end

  def create
    get_resource
    if resource.present?
      resource.send_reset_password_instructions!
      redirect_to login_path, notice: "Reset Instructions has been sent to user"
    else
      redirect_to login_path, notice: "User doesn't exists"
    end
  end

  private

  def get_resource
    self.resource = User.find_by(email: reset_password_params[:email].downcase)
  end

  def reset_password_params
    params.require(:user).permit(:email)
  end
end
