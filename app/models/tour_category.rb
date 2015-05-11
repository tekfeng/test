class TourCategory < ActiveRecord::Base
  has_many :tours
  validates :name, :presence => true
  
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
    page = opts[:page] ? opts[:page].to_i : 1
    tour_categories = self.all
    tour_categories = tour_categories.where(columns_condition.join(" OR "), keyword: "%#{opts[:keywords].downcase}%") if opts[:keyword]
    tour_categories = tour_categories.page(page).per(10)
    return {tour_categories: tour_categories, total_page: tour_categories.total_pages, current_page: page}
  end
end
