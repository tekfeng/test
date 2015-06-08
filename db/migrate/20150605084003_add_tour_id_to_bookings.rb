class AddTourIdToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :tour_id, :integer
  end
end
