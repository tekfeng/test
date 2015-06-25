class BaseController < ActionController::Base
  layout 'dashboard'

  protect_from_forgery with: :exception
  before_action :authenticate_user!
end
