class Source < ActiveRecord::Base
  has_many :customer, dependent: :destroy
  validates :name, :presence => true
  validates :name, :uniqueness => true
  
  def self.search(opts)    
    sources = self.all
    sources = sources.where("name LIKE :word", word: "%#{opts[:keyword].downcase}%")  if opts[:keyword] && opts[:keyword] != ""
    return sources
  end
  
  
  def as_json(options={})
    {
      id: id,
      name: name
    }
  end
end
