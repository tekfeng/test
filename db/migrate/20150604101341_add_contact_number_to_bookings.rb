class AddContactNumberToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :contact_number, :string
    add_column :bookings, :number_adult, :integer
    add_column :bookings, :number_child, :integer
  end
end
