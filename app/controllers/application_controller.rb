class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  layout :layout_by_resource
  
  protected

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || '/dashboard'
  end
  
  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(_resource_or_scope)
    '/users/sign_in'
  end
    
  def layout_by_resource
    if devise_controller?
      "login"
    else
      "application"
    end
  end
end
