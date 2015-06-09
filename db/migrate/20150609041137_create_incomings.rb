class CreateIncomings < ActiveRecord::Migration
  def change
    create_table :incomings do |t|
      t.string :customer_name
      t.string :email_address
      t.string :title
      t.text :content
      t.string :source_info
      t.timestamps null: false
    end
  end
end
