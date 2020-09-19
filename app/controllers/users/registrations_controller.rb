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
    if @user.save
      flash[:success] = "ユーザを登録しました"
      redirect_to root_path
    else
      flash[:danger] = "ユーザの登録に失敗しました"
      render :new and return
    end
  end


  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :family_name, :first_name, :family_name_reading, :first_name_reading, :birth_day])
  end
end
