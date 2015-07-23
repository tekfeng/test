class AddAvailabilityToCaptains < ActiveRecord::Migration
  def change
    add_column :captains, :availability, :boolean, default: true
  end
end
