class TicketPurchasesController < ApplicationController

  def index
    @ticket_purchases = TicketPurchase.all
  end

  def show
  end

  def new
    @ticket_purchase = TicketPurchase.new
  end

  def create
    @ticket_purchase = TicketPurchase.new(ticket_purchase_params)
  end

private

  def ticket_purchase_params
    params.require(:ticket_purchase).permit(:name, :email, :age_confirm, :cc_number, :cc_cvc, :cc_exp_mth, :cc_exp_yr, :final_cost, :zip_code)
  end
end
