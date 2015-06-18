class VendorRate < ActiveRecord::Base
  # rate_type value 1: contact current rate, 2:next contact rate, 3: competitor rate, 4: ad-hoc rate
  belongs_to :vendor
  has_many :competitors
  has_many :season_room_prices  
  
  validates :effective, :expired, presence: true, :unless => :is_competitor_rate
  
  accepts_nested_attributes_for :competitors, allow_destroy: true

  has_attached_file :contract_file
  
  def is_competitor_rate
    if self.rate_type == 3
      true
    else
      false
    end
  end
  
  
end
