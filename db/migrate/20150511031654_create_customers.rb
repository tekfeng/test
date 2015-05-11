class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :email_address
      t.string :contact_number
      t.string :address
      t.integer :country_id
      t.string :source
      t.timestamps
    end
  end
end
