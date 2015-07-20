class AddDepartmentCodeToDepartment < ActiveRecord::Migration
  def change
    add_column :departments, :code, :string
    Department.all.each do |department|
      department.code = "sales" if department.id  == 1
      department.code = "reservations" if department.id  == 2
      department.code = "operations" if department.id  == 3
      department.code = "finance" if department.id  == 4
      
      department.save(validate: false)
    end  
  end
end