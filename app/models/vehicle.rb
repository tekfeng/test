class Vehicle < ActiveRecord::Base
  belongs_to :vehicle_type
  validates :vehicle_no, :licence_validity, :vehicle_type_id, presence: true
  
end
