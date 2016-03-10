class Users::RegistrationsController < Devise::RegistrationsController

  layout "dashboard", only: [:edit]

  private
  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :artist, :picture, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :profile_picture, :picture, :email, :password, :password_confirmation, :gender, :address_street, :address_city, :address_postal_code, :address_country, :presentation, :phone_number, :avatar, portfolio_photos: [], photos: [])
  end

  protected

  def after_update_path_for(resource)
    me_artist_path
  end

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

end
