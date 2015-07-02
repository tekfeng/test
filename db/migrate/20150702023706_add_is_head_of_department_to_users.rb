class AddIsHeadOfDepartmentToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_head_of_department, :boolean, default: false
  end
end
