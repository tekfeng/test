class AdminsController < BaseController
  before_filter :check_superadmin  
  before_filter :admins_menu
  
  def dashboard
  end
  
  def admins_menu
    session[:current_menu] = 'admins'
  end
  
  def check_superadmin
    if !current_user.is_superadmin
      return redirect_to "/"
    end
  end  
end
