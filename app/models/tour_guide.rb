class TourGuide < ActiveRecord::Base
  validates :name, :period, :tour_type, presence: true
  validates :total_tours, :total_allowances, :allowance, numericality: { only_integer: true, greater_than: -1}, allow_blank: true
  
end
