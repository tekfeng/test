class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.datetime :travel_date
      t.string :user_id
      t.string :tour_id
      t.string :status
      t.string :sales_person
      t.string :itinerary

      t.timestamps null: false
    end
  end
end
