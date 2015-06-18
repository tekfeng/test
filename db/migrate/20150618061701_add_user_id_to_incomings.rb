class AddUserIdToIncomings < ActiveRecord::Migration
  def change
    add_column :incomings, :user_id, :integer
  end
end
