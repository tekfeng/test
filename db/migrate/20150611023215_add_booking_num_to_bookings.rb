class AddBookingNumToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :booking_number, :string
  end
end
