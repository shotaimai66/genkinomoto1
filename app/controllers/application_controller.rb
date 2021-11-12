class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :authenticate_staff!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    case resource
    when User
      root_path
    when Staff
      staffs_path
    end
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :enter_date])
      devise_parameter_sanitizer.permit(:account_update, keys: [
        :name,
        :kana,
        :sex,
        :birthday,
        :postal_code,
        :prefecture_code,
        :city,
        :street,
        :other_address,
        :exit_date
        ])
    end
end
