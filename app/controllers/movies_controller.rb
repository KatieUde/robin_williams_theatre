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
    @viewings = Viewing.all
  end

  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: "New movie was successfully added." }
        format.json { render :show, status: :created }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @movie = Movie.find(params[:id])
    # @movie.update(movie_params)
  end

  def show
    @movie = Movie.find(params[:id])
    @movie.viewings = Viewing.all
    @movie.name
    @movie.ombd_id
    @movie.youtube
    @movie_data = HTTParty.get "http://www.omdbapi.com/?i=#{@movie.ombd_id}&plot=full&r=json"
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.update(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to new_movie_path, notice: "New movie was successfully added." }
        format.json { render :show, status: :created }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: "This movie was successfully removed." }
      format.json { head :no_content }
    end
  end

private
  def movie_params
    params.require(:movie).permit(:id, :name, :rating, :ombd_id, :ombd_poster, :youtube, :playing_now, :upcoming)
  end
end
