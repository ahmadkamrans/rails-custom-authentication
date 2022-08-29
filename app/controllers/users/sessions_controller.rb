class Users::SessionsController < ApplicationController
  view_accessor :resource

  before_action :redirect_logged_in_user, only: [:create, :new]

  before_action :authenticate_user!, only: [:destroy]

  def new
    self.resource = User.new
  end

  def create
    build_resource
    if resource
      if resource.authenticate(sign_in_params[:password])
        login(resource)
        redirect_to root_path, notice: "Signed in successfully."
      else
        flash[:alert] = "Incorrect email or password."
        render :new, status: :unprocessable_entity
      end
    else
      flash[:alert] = "User doesn't exists. Please sign up"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to login_path, notice: "Signed out successfully."
  end

  private

  def build_resource
    self.resource = User.find_by(email: sign_in_params[:email].downcase)
  end

  def sign_in_params
    params.require(:user).permit(:email, :password)
  end
end
