class TicketDetailsController < ApplicationController

  def index
    @ticket_details = TicketDetail.all
    @ticket_detail = TicketDetail.new
  end

  def show
  end

  def new
    @ticket_details = TicketDetail.all
    @ticket_detail = TicketDetail.new
  end

  def create
    @ticket_detail = TicketDetail.new(ticket_detail_params)

    respond_to do |format|
      if @ticket_detail.save
        format.html { redirect_to new_ticket_detail_path, notice: "New ticket type was added." }
        format.json { render :show, status: :created }
      else
        format.html { render :new }
        format.json { render json: @ticket_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @ticket_detail = TicketDetail.find(params[:id])
    # @movie.update(movie_params)
  end

  def update
    @ticket_detail = TicketDetail.find(params[:id])
    @ticket_detail.update(ticket_detail_params)

    respond_to do |format|
      if @ticket_detail.save
        format.html { redirect_to new_ticket_detail_path, notice: "Ticket type was successfully updated." }
        format.json { render :show, status: :created }
      else
        format.html { render :new }
        format.json { render json: @ticket_detail.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @ticket_detail = TicketDetail.find(params[:id])
    @ticket_detail.destroy
    respond_to do |format|
      format.html { redirect_to ticket_details_url, notice: "This ticket type has been successfully removed." }
      format.json { head :no_content }
    end
  end

private

  def ticket_detail_params
    params.require(:ticket_detail).permit(:ticket_cost, :ticket_style)
  end

end
