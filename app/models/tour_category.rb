class TourCategory < ActiveRecord::Base
  has_many :tours, dependent: :destroy
  validates :name, :presence => true
  validates :name, :uniqueness => true
  
  has_many :booking_tour_category_tours, dependent: :destroy
  
  def as_json(options={})
    {
      id: id,
      name: name
    }
  end
  
  def self.search(opts)
    columns_condition = self.columns.inject([]) do |array, el|
      array << "lower(#{self.table_name}.#{el.name}) LIKE :keyword" if (el.type == :string or el.type == :text)
      array
    end
    tour_categories = self.all
    tour_categories = tour_categories.where(columns_condition.join(" OR "), keyword: "%#{opts[:keyword].downcase}%") if opts[:keyword] && opts[:keyword] != ""
    return tour_categories
  end
  
  def sortable(opts)
    if (opts[:sort_by] == "descending")
      tour_categories = tour_categories.sort_by{ |t| t.name.downcase }.reverse
    else
      tour_categories = tour_categories.sort_by{ |t| t.name.downcase }
    end
  end
end
