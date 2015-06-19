class SalesController < BaseController
  before_filter :check_sales_user
  
  
  def dashboard
  end
  
  def check_sales_user
    if (current_user.department_id != 1 and !current_user.is_superadmin)
      return redirect_to "/"
    end
  end
  
end
