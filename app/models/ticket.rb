class Ticket < ActiveRecord::Base
  belongs_to :viewing
  belongs_to :ticket_detail
  belongs_to :ticket_purchase
end
