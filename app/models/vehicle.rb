class Vehicle < ActiveRecord::Base
  belongs_to :vehicle_type
  validates :licence_validity, :vehicle_type_id, presence: true
  validates :vehicle_no, presence: true, uniqueness: true
end
