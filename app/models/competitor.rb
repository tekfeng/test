class Competitor < ActiveRecord::Base
  belongs_to :vendor_rate
  validates :name, presence: true
end
