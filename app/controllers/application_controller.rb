class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?


protected
	def after_sign_in_path_for(resource)
    if resource.role == 'admin'
      app_users_path
    elsif resource.role == 'customer'
    	shipments_path
    elsif resource.role == 'delivery_partner'
    	shipments_path
    else
      authenticated_root_path
    end
  end

def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :role])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :role])
  end
end
