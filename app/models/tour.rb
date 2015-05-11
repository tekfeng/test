class Tour < ActiveRecord::Base
  belongs_to :tour_category
  validates :name, :presence => true
  validates :code, :presence => true
  validates :tour_category_id, :presence => true
  
  def as_json(options={})
    {
      id: id,
      name: name,
      code: code,
      tour_category: tour_category ? tour_category.name : "N/A"
    }
  end
  
  def self.search(opts)
    columns_condition = self.columns.inject([]) do |array, el|
      array << "lower(#{self.table_name}.#{el.name}) LIKE :keyword" if (el.type == :string or el.type == :text)
      array
    end
    page = opts[:page] ? opts[:page].to_i : 1
    tours = self.all
    tours = tours.where(columns_condition.join(" OR "), keyword: "%#{opts[:keyword].downcase}%") if opts[:keyword]
    tours = tours.where("tours.tour_category_id = ?", opts[:tour_category_id].to_i) if opts[:tour_category_id]
    tours = tours.page(page).per(10)
    return {tours: tours, total_page: tours.total_pages, current_page: page}
  end
end
