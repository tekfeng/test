class AddLeadIdToTours < ActiveRecord::Migration
  def change
    add_column :tours, :lead_id, :integer
  end
end
