class Users::RegistrationsController < Devise::RegistrationsController

  def create
    user = User.find_by(email: sign_up_params[:email])

    if user.present?
      flash[:danger] = "An account with this email already exists"
      redirect_to new_user_registration_path
      return
    elsif sign_up_params[:email].blank?
      flash[:danger] = "Enter a email to create an account"
      redirect_to new_user_registration_path
    elsif sign_up_params[:password].blank?
      flash[:danger] = "You must enter a password to create an account"
      redirect_to new_user_registration_path
    elsif sign_up_params[:password_confirmation].blank?
      flash[:danger] = "You must confirm your password to create an account"
      redirect_to new_user_registration_path
    else
      build_resource(sign_up_params)
      resource.save
      set_flash_message! :success, :signed_up
      sign_up(resource_name, resource)
      respond_with resource, location: after_sign_up_path_for(resource)
    end
  end

end
