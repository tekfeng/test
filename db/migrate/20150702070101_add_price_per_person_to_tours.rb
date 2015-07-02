class AddPricePerPersonToTours < ActiveRecord::Migration
  def change
    add_column :tours, :price_per_person, :float
    add_column :tours, :description, :text
    add_column :tours, :min_number_pax, :integer
  end
end
