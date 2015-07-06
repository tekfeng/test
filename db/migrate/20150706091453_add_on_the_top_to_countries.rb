class AddOnTheTopToCountries < ActiveRecord::Migration
  def change
    add_column :countries, :on_the_top, :boolean, default: false
  end
end
