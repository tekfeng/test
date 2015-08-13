class VehicleType < ActiveRecord::Base
  has_many :vehicles, dependent: :nullify
end
