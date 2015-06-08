class BookingTourCategoryTour < ActiveRecord::Base
  belongs_to :booking
  belongs_to :tour
  belongs_to :tour_category
end
