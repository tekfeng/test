class Incoming < ActiveRecord::Base
  
  belongs_to :user
  has_many :incoming_comments, dependent: :destroy
  
  scope :search_all, -> (word) {where("customer_name LIKE :word OR email_address LIKE :word", word: "%#{word}%")}    
  
  SOURCE_INFO = ["info@amz", "sample" , "borneo@info"]
  
  def self.generate_mockup_data
    name = ["josh", "minge", "nick", "moral", "kovac"]
    
    (1..10).each do |i|
      random_pick = name.sample
      Incoming.create({
        customer_name: random_pick,
        email_address: "#{random_pick}@sample.com",
        title: "Interested in",
        content: "Sed mollis ex in nulla euismod, vel consectetur sem malesuada. Curabitur gravida, ante et accumsan tempor, eros urna sollicitudin ligula, ac sollicitudin lorem mi feugiat sem. Nunc condimentum, erat sit amet pharetra sagittis, eros quam posuere tortor, eget facilisis nulla metus in lacus. Donec erat felis, tincidunt a velit at, rutrum condimentum libero. Sed eu est ligula. Integer viverra consectetur sem in tincidunt. Nunc blandit semper luctus.",
        source_info: Incoming::SOURCE_INFO.sample
      })    
    end      
  end  
  
  def self.ransackable_scopes(auth_object = nil)
    if auth_object.try(:admin?)
      # allow admin users access to all three methods
    else
      # allow other users to search on active and hired_since only
      %i(active search_all)
    end
  end
  
  
end
