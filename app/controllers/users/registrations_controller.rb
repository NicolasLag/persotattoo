class Users::RegistrationsController < Devise::RegistrationsController

  private
   def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :picture, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :picture, :email, :password, :password_confirmation)
  end

  protected

    def after_update_path_for(resource)
      me_path
    end

    def after_sign_in_path_for(resource)
      me_path
    end

    def after_sign_up_path_for(resource)
      me_path
    end
end
