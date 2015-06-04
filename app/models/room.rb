class Room < ActiveRecord::Base
  belongs_to :vendor
  has_many :season_room_prices
end
