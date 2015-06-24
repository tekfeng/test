class NotificationsController < BaseController
  
  def read_notification
    current_user.notifications.update_all(:is_read => true)
    render json: {status: "ok"}
  end
  
  def notifications_of_user
    @user = current_user
    render partial: "/leads/notifications_of_user.html.erb"
  end
  
  def edit_profile
    @user = current_user
    render partial: "/users/edit_profile.html.erb"
  end
  
  def update_profile
    @user = current_user
    if @user.update_attributes(users_params)    
      redirect_to "/"
    else
      render :action => "edit_profile"
    end
  end
  
  private 
   
  def users_params
    params.require(:user).permit(:email, :contact_number, :avatar)
  end
end
