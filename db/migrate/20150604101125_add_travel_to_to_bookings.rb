class AddTravelToToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :travel_to, :datetime
  end
end
