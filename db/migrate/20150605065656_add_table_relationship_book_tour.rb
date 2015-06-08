class AddTableRelationshipBookTour < ActiveRecord::Migration
  def up
    create_table :booking_tours do |t|
      t.integer :booking_id
      t.integer :tour_id
    end
    
    create_table :leading_tours do |t|
      t.integer :lead_id
      t.integer :tour_id
    end
  end

  def down
  end
end
