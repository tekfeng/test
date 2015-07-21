class MountainGuide < ActiveRecord::Base
  validates :name, :period, presence: true
  validates :total_climb, :penalty, :incentive, numericality: { only_integer: true, greater_than: -1}, allow_blank: true
  
end
