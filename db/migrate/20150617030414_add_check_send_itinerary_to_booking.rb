class AddCheckSendItineraryToBooking < ActiveRecord::Migration
  def change
    add_column :bookings, :check_send_itinerary, :boolean, default: false
  end
end
