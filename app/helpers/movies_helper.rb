module MoviesHelper

  def movie_ids
    @movies.collect(&:id).join(',')
  end

end
