class MoviesController < ApplicationController

  def index
    @movies = Movie.all
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
  end

  def update
  end

  def destroy
    @movie.destroy
  end

  def movie_params
    params.require(:movie).permit(:name, :ombd_id, :ombd_poster)
  end

end
