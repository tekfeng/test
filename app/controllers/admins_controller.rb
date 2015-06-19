class AdminsController < BaseController
  before_filter :check_superadmin  
  
  def dashboard
  end
  
  def check_superadmin
    if !current_user.is_superadmin
      return redirect_to "/"
    end
  end  
end
