class Users::RegistrationsController < ApplicationController
  view_accessor :resource

  before_action :redirect_logged_in_user, only: %i[create new]
  
  def new
    self.resource = User.new
  end

  def create
    build_resource
    if resource.save
      redirect_to login_path, notice: "User created successfully. Please login to continue."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def build_resource
    self.resource = User.new(sign_up_params)
  end

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
