class VendorCategory < ActiveRecord::Base
  has_many :vendors
  validates :name, presence: true
  
end
