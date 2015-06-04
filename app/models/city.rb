class City < ActiveRecord::Base
  has_many :vendors
  has_many :vendor_rates
end
