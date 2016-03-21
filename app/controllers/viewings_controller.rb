class ViewingsController < ApplicationController
  def index
    @viewings = Viewing.all
  end

  def new
    @movies = Movie.all
    @viewing = Viewing.new
    @viewings = Viewing.all
    @viewing_rooms = ViewingRoom.all
  end

  def create
    @viewing = Viewing.new(viewing_params)

    respond_to do |format|
      if @viewing.save
        format.html { redirect_to @viewing, notice: "New viewing was successfully added." }
        format.json { render :show, status: :created }
      else
        format.html { render :new }
        format.json { render json: @viewing.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def show
    @viewing = Viewings.all
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
    params.require(:viewing).permit()
  end

end
