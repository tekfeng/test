class ChangeColumnNameForSourceInCustomer < ActiveRecord::Migration
  def up
    change_column :customers, :source, :integer
    rename_column :customers, :source, :source_id
  end

  def down
    change_column :customers, :source, :string
    rename_column :customers, :source_id, :source
  end
end
