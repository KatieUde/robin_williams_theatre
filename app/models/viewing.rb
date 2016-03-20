class Viewing < ActiveRecord::Base
  belongs_to :viewing_room
  belongs_to :movie
  has_many :ticket_purchases

end
