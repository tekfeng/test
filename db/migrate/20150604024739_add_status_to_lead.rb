class AddStatusToLead < ActiveRecord::Migration
  def change
    add_column :leads, :status, :string
  end
end
