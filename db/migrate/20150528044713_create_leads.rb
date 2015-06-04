class CreateLeads < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.integer :customer_id
      t.date :travel_from
      t.date :travel_to
      t.string :contact_number
      t.integer :adults
      t.integer :children

      t.timestamps null: false
    end
  end
end
