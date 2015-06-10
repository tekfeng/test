class LeadTourCategoryTour < ActiveRecord::Base
  belongs_to :lead
  belongs_to :tour
  belongs_to :tour_category
  validates :tour_category_id, :presence => true
  validates :tour_id, :presence => true
end
