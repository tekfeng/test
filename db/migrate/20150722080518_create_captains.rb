class CreateCaptains < ActiveRecord::Migration
  def change
    create_table :captains do |t|
      t.string :name
      t.string :contact
      t.text :address
      t.string :email
      t.string :center
      t.integer :allowance
      t.date :join_date
      t.string :personal_particular
      t.text :remark
      t.timestamps null: false
    end
  end
end
