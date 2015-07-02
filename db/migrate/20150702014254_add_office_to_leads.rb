class AddOfficeToLeads < ActiveRecord::Migration
  def change
    add_column :leads, :office, :string
  end
end
