class CreateMtqSlots < ActiveRecord::Migration
  def change
    create_table :mtq_slots do |t|
      t.datetime :date
      t.integer :available_slot

      t.timestamps null: false
    end
  end
end
