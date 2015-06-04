class VendorRate < ActiveRecord::Base
  # rate_type value 1: contact current rate, 2:next contact rate, 3: competitor rate, 4: ad-hoc rate
  belongs_to :vendor
  has_many :competitors
  has_many :season_room_prices  
  
  accepts_nested_attributes_for :competitors, allow_destroy: true
  
  
  has_attached_file :contract_file
  validates_attachment_content_type :contract_file, :content_type => ["application/pdf","application/vnd.ms-excel",  "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", "application/msword", "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "text/plain"]
end
