class NotificationsController < BaseController
  
  def read_notification
    current_user.notifications.update_all(:is_read => true)
    render json: {status: "ok"}
  end
  
  def notifications_of_user
    @user = current_user
    render partial: "/leads/notifications_of_user.html.erb"
  end
   
end
