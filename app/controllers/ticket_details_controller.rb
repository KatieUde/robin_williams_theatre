class TicketDetailsController < ApplicationController

  def index
    @ticket_details = TicketDetail.all
  end

  def show
  end
  
end
