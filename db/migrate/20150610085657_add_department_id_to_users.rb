class AddDepartmentIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :department_id, :integer
    add_column :users, :contact_number, :string
  end
end
