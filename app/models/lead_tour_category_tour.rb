class LeadTourCategoryTour < ActiveRecord::Base
  belongs_to :lead
  belongs_to :tour
  belongs_to :tour_category
end
