class InventoryItem < ActiveRecord::Base
  belongs_to :item_category
  belongs_to :center
  
end
