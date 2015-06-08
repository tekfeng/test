class ChangeTypeUserIdInBooking < ActiveRecord::Migration
  def change
    change_column :bookings, :user_id, :integer
    # remove_column :bookings, :tour_id
  end
end
