class RemoveNameInBookings < ActiveRecord::Migration
  def change
    remove_column :bookings, :name
    remove_column :bookings, :booking_date
    remove_column :bookings, :sales_person   
  end
end
