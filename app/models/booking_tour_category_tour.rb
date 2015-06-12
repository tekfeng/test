class BookingTourCategoryTour < ActiveRecord::Base
  belongs_to :booking
  belongs_to :tour
  belongs_to :tour_category
  validates :tour_category_id, :presence => true
  validates :tour_id, :presence => true
end