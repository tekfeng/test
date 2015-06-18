class AddNotifitableTypeToNotifications < ActiveRecord::Migration
  def change
    add_column :notifications, :notifitable_type, :string
    add_column :notifications, :notifitable_id, :integer
  end
end
