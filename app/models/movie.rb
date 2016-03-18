class Movie < ActiveRecord::Base
  has_many :viewings
  has_many :ticket_purchases
end
