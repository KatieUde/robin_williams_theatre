class TicketPurchasesController < ApplicationController

  def index
    @ticket_purchases = TicketPurchase.all
  end

  def show
  end

  def new
    @movies = Movie.all
    @ticket_purchase = TicketPurchase.new
  end

  def create
    @movies = Movie.all
    @ticket_purchase = TicketPurchase.new(ticket_purchase_params)

    respond_to do |format|
      if @ticket_purchase.save
        format.html { redirect_to @ticket_purchase, notice: "New ticket was successfully purchased." }
        format.json { render :show, status: :created }
      else
        format.html { render :new }
        format.json { render json: @ticket_purchase.errors, status: :unprocessable_entity }
      end
    end
  end

private

  def ticket_purchase_params
    params.require(:ticket_purchase).permit(:name, :email, :age_confirm, :cc_number, :cc_cvc, :cc_exp, :final_cost, :zip_code, :movie_id, :viewing_id)
  end
end
