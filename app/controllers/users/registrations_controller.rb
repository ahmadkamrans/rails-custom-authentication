class Users::RegistrationsController < ApplicationController
  view_accessor :resource

  def new
    self.resource = User.new
  end

  def create
    build_resource(sign_up_params)
    if resource.save
      redirect_to login_path, notice: "User created successfully. Please login to continue."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def build_resource
    self.resource = User.new(user_params)
  end

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
