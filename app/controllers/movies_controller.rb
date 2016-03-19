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
    if @movie.save
      redirect_to @movie
    else
      render :new
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
