class AddNumberVendorToVendorCategories < ActiveRecord::Migration
  def change
    add_column :vendor_categories, :number_vendor, :integer
  end
end
