class AddIncomingIdToLeads < ActiveRecord::Migration
  def change
    add_column :leads, :incoming_id, :integer
  end
end
