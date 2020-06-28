class Room < ApplicationRecord
  belongs_to :user

  validates_presence_of :home_type, :room_type, :accommodate, :bed_room, :bath_room
end
