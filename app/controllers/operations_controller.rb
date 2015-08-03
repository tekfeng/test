class OperationsController < BaseController
  
  before_filter :check_operations_user
  before_filter :operations_menu
  
  def operations_menu
    session[:current_menu] = 'operations'
  end  
  
  def dashboard
  end  
  
  
  private
  def check_operations_user
    if (current_user.department_id != 1 and !current_user.is_superadmin)
      return redirect_to "/"
    end
  end
  
  
  
  
  
  
end
