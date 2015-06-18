class Notification < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :notifitable, :polymorphic => true
  
  # validates :notifitable_type, presence: true
#   validates :notifitable_id, presence: true
  
  def url
    url = "/sales/" + self.notifitable_type.downcase + "s/" + self.notifitable_id.to_s + "/edit"
  end
  
end
