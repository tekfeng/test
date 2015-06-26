class City < ActiveRecord::Base
  has_many :vendors, dependent: :destroy
  has_many :vendor_rates, dependent: :destroy
end
