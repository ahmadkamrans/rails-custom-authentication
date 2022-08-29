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

  def edit
    find_resource_by_token
    if resource.nil?
      redirect_to new_password_path, alert: "The link is invalid"
    end
  end

  def update
    find_resource_by_token
    if resource
      
      if resource.update(password_params)
        redirect_to login_path, notice: "Password reset successfully"
      else
        flash[:alert] = resource.errors.full_messages.to_sentence
        render :edit, status: :unprocessable_entity
      end
    else
      flash[:alert] = "Invalid link"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def get_resource
    self.resource = User.find_by(email: reset_password_params[:email].downcase)
  end

  def find_resource_by_token
    self.resource = User.find_signed(params[:password_reset_token])
  end

  def reset_password_params
    params.require(:user).permit(:email)
  end

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
