class CreateBookingTourCategoryTours < ActiveRecord::Migration
  def change
    create_table :booking_tour_category_tours do |t|
      t.integer :tour_id
      t.integer :booking_id
      t.integer :tour_category_id

      t.timestamps null: false
    end
  end
end
