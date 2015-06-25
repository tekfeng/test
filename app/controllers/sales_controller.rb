class SalesController < BaseController
  before_filter :check_sales_user
  before_filter :sales_menu
  
  def dashboard
  end
  
  def sales_menu
    session[:current_menu] = 'sales'
  end  
  
  def check_sales_user
    if (current_user.department_id != 1 and !current_user.is_superadmin)
      return redirect_to "/"
    end
  end
  
end
