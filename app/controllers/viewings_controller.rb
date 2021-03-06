class ViewingsController < ApplicationController
  def index
    @viewings = Viewing.all
  end

  def new
    # @movies = Movie.all
    @viewing = Viewing.new
    @viewings = Viewing.all
    # @viewing_rooms = ViewingRoom.all
  end

  def create
    @viewing = Viewing.new(viewing_params)

    respond_to do |format|
      if @viewing.save
        format.html { redirect_to new_viewing_path, notice: "New viewing was successfully added." }
        format.json { render :show, status: :created }
      else
        format.html { render :new }
        format.json { render json: @viewing.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
      @viewing = Viewing.find(params[:id])
  end

  def show
    @viewing = Viewing.find(params[:id])
    # @movie = Movie.find(params[:movie_id])
  end

  def update
  end

  def destroy
    @viewing = Viewing.find(params[:id])
    @viewing.destroy
    respond_to do |format|
      format.html { redirect_to viewings_url, notice: "This viewing has been successfully removed." }
      format.json { head :no_content }
    end
  end

private
  def viewing_params
    params.require(:viewing).permit(:movie_id, :viewing_room_id, :view_time, :view_date)
  end

end
