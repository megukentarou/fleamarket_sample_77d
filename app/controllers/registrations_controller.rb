class RegistrationsController < ApplicationController
# GET /resource/sign_up
  def new
    @user = User.new
  end

  # POST /resource
  def create
    @user = User.new(sign_up_params)
  end

  protected

  def sign_up_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :family_name, :first_name, :family_name_reading, :first_name_reading, :birth_day)
  end
end
