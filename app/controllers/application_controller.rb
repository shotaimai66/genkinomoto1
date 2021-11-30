class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :authenticate_staff!
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  # for friendly-forwarding
  before_action :store_user_location!, if: :storable_location?

  def after_sign_in_path_for(resource)
    case resource
    when User
      users_account_path
    when Staff
      staffs_account_path
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
        :phone,
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

    private
    # for friendly-forwarding
    def storable_location?
      request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
    end
    # for friendly-forwarding
    def store_user_location!
      store_location_for(:user, request.fullpath)
    end
end
