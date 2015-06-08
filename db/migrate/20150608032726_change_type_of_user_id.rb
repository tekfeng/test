class ChangeTypeOfUserId < ActiveRecord::Migration
  def change
     change_column :leads, :user_id, :integer
  end
end
