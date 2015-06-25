class ReservationsController < BaseController
  before_filter :check_reservations_user
  before_filter :reservation_menu
  
  
  def dashboard
  end
  
  def reservation_menu
    session[:current_menu] = 'reservations'
  end   
  
  def check_reservations_user
    if (current_user.department_id != 2 and !current_user.is_superadmin)
      return redirect_to "/"
    end
  end
  
  
end
