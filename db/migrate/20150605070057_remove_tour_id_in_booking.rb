class RemoveTourIdInBooking < ActiveRecord::Migration
  def change
    remove_column :bookings, :tour_id
  end
end
