class CreateCenters < ActiveRecord::Migration
  def change
    create_table :centers do |t|
      t.string :name
      t.string :code
      t.timestamps null: false
    end
  end
end
