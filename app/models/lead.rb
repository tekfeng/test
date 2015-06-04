class Lead < ActiveRecord::Base
  belongs_to :customer
  validates :customer_id, :presence => true
  validates :travel_from, :presence => true
  validates :travel_from, :uniqueness => true
  validates :travel_to, :presence => true
  validates :travel_to, :uniqueness => true
  validates :contact_number, :presence => true
  validates :contact_number, :uniqueness => true
  validates :adults, :presence => true
  validates :adults, :uniqueness => true
  validates :children, :presence => true
  validates :children, :uniqueness => true
  has_many :tours
  accepts_nested_attributes_for :tours, allow_destroy: true
  
end


