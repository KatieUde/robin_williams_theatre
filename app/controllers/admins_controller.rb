class AdminsController < ApplicationController
  def index
    @ticket_purchases = TicketPurchase.all
  end

  def show
    @ticket_purchases = TicketPurchase.all
  end
end
