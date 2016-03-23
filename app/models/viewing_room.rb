class ViewingRoom < ActiveRecord::Base
  has_many :viewings
end

def seats_left
  self.viewing_room.seat_quantity - self.tickets.count
end

def check_for_seat
  if self.seats.left <= 0
    self.seats_left == false
    self.save
  end
end
