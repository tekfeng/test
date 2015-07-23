class Captain < ActiveRecord::Base
  validates :name, :email, :contact, presence: true
  validates :allowance, numericality: { only_integer: true, greater_than: -1}, allow_blank: true
  
  
end
