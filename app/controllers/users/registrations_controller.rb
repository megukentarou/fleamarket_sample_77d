class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  # GET /resource/sign_up
  def new
    @user = User.new
  end

  # POST /resource
  def create
    @user = User.new(sign_up_params)
    unless @user.valid?
      flash.now[:alert] = @user.errors.full_messages
      render :new and return
    end

    session["devise.regist_data"] = {user: @user.attributes}
    session["devise.regist_data"][:user]["password"] = params[:user][:password]
    @residency = @user.build_residency
    render :new_residency
  end

  def new_residency
  end

  def create_residency
    @user = User.new(session["devise.regist_data"]["user"])
    @residency = Residency.new(residency_params)
    unless @residency.valid?
      flash.now[:alert] = @residency.errors.full_messages
      render :new_residency and return
    end
    @user.build_residency(@residency.attributes)
    @user.save
    redirect_to root_path
  end

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :family_name, :first_name, :family_name_reading, :first_name_reading, :birth_day])
  end

  def residency_params
    params.require(:residency).permit(:prefecture_id, :family_name, :first_name, :family_name_reading, :first_name_reading, :city, :address, :zip_code, :building, :phone)
  end
end
