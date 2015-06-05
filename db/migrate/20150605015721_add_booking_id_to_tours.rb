class AddBookingIdToTours < ActiveRecord::Migration
  def change
    add_column :tours, :booking_id, :integer
  end
end
