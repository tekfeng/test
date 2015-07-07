class NotificationsController < BaseController
  
  def read_notification
    current_user.notifications.update_all(:is_read => true)
    render json: {status: "ok"}
  end
  
  def notifications_of_user
    @user = current_user
    render partial: "/leads/notifications_of_user.html.erb"
  end
  
  def clear_all_notifications_of_user
    current_user.notifications.destroy_all
    render json: {success: true}
  end
  
  def destroy_notification_of_user
    Notification.find(params[:id]).destroy
    render json: {success: true}
  end
  
end
