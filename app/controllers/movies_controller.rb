class MoviesController < ApplicationController

  def index
    @movies = Movie.all
    @now_showing = @movies.select do |movie|
      movie.playing_now == true
    end

    @coming_soon = @movies.select do |movie|
      movie.upcoming == true
    end

  end

  def new
    @movie = Movie.new
    @movies = Movie.all
  end

  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect to @movie, notice: "New movie was successfully added." }
        format.json { render :show, status: :created }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def show
    @movie = Movie.find(params[:id])
    @movie.name
    @movie.ombd_id
    @movie_data = HTTParty.get "http://www.omdbapi.com/?i=#{@movie.ombd_id}&plot=full&r=json"
  end

  def update
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    # redirect_to , notice: 'Movie has been removed from listing.'
  end

private
  def movie_params
    params.require(:movie).permit(:id, :name, :ombd_id, :ombd_poster)
  end
end
