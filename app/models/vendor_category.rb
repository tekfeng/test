class VendorCategory < ActiveRecord::Base
  has_many :vendors
  validates :name, presence: true
  validate :name_uniqueness
  
  def name_uniqueness
    vd_cate = VendorCategory.find_by_name(self.name)
    if vd_cate
      self.errors.add(:name, "has already been taken")
    else
      return true
    end
  end
 
end
