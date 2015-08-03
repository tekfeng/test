class ChangeVehicleCategoryIdToVehicleTypeId < ActiveRecord::Migration
  def change
    rename_column :vehicles, :vehicle_category_id, :vehicle_type_id
  end
end
