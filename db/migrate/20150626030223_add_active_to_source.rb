class AddActiveToSource < ActiveRecord::Migration
  def change
    add_column :sources, :active, :boolean, :default => false
  end
end
