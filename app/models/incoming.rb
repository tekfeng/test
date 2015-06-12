class Incoming < ActiveRecord::Base
  
  has_many :incoming_comments, dependent: :destroy
  
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
end
