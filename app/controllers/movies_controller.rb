class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def create
    @movie = Movie.new
  end

  def new
    @movie = Movie.new
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
end
