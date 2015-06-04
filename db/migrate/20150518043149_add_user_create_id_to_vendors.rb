class AddUserCreateIdToVendors < ActiveRecord::Migration
  def change
    add_column :vendors, :user_create_id, :integer
    add_column :vendors, :user_update_id, :integer
  end
end
