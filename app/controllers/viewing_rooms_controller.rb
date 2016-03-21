class ViewingRoomsController < ApplicationController
  def index
    @viewing_rooms = ViewingRoom.all
  end

  def show
    @viewing_room = ViewingRoom.find(params[:id])
    @viewing_room.room_number
    @viewing_room.seat_max
  end

  def new
    @viewing_rooms = ViewingRoom.all
    @viewing_room = ViewingRoom.new
    # @ticket_details = TicketDetail.all
    # @ticket_detail = TicketDetail.new
  end

  def edit
  end

  def create
    @viewing_room = ViewingRoom.new(viewing_room_params)

    respond_to do |format|
      if @viewing_room.save
        format.html { redirect_to new_viewing_room_path, notice: "New auditorium was successfully added." }
        format.json { render :show, status: :created }
      else
        format.html { render :new }
        format.json { render json: @viewing_room.errors, status: :unprocessable_entity }
      end
    end

  end

  def update
  end

  def destroy
    @viewing_room = ViewingRoom.find(params[:id])
    @viewing_room.destroy
    respond_to do |format|
      format.html { redirect_to viewings_room_url, notice: "This auditorium has been successfully removed." }
      format.json { head :no_content }
    end
  end

private
  def viewing_room_params
    params.require(:viewing_room).permit(:room_number, :seat_max)
  end

end
