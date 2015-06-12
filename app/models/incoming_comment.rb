class IncomingComment < ActiveRecord::Base
  belongs_to :incoming
  belongs_to :user
  validates :content , presence: true
end
