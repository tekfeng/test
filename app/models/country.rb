class Country < ActiveRecord::Base
  has_many :customer, dependent: :destroy
  validates :name, :presence => true
  validates :name, :uniqueness => true
  
  def as_json(options={})
    {
      id: id,
      name: name
    }
  end
end
