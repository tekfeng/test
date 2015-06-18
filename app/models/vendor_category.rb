class VendorCategory < ActiveRecord::Base
  has_many :vendors
  validates :name, presence: true
  validates :name, uniqueness: true
end
