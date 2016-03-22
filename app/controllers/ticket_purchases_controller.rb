class TicketPurchasesController < ApplicationController

  def index
    @ticket_purchases = TicketPurchase.all
  end

  def show
  end

  def new
    @movie = Movie.find_by_id(params[:id])
    @movies = Movie.all
    @ticket_purchase = TicketPurchase.new
  end

  def create
    @movies = Movie.all
    @ticket_purchase = TicketPurchase.new(ticket_purchase_params)

      if @ticket_purchase.save
        redirect_to @ticket_purchase, notice: "New ticket was successfully purchased." }
        TicketPurchaseMailer.send_receipt(@ticket_purchase, @ticket_purchase.email).deliver_now
      else
        render :new, errors: @ticket_purchase.errors
      end
    end
  end

private

  def ticket_purchase_params
    params.require(:ticket_purchase).permit(:name, :email, :age_confirm, :cc_number, :cc_cvc, :cc_exp, :final_cost, :zip_code, :movie_id, :viewing_id)
  end
end
