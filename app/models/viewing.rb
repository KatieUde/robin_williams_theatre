class Viewing < ActiveRecord::Base
  belongs_to :auditorium
  belongs_to :movie
  has_many :ticket_purchases

end
