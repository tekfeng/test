class AddVendorCategoryIdToVendors < ActiveRecord::Migration
  def change
    add_column :vendors, :vendor_category_id, :integer
  end
end
