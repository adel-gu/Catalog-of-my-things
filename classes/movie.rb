require_relative './item'
require './modules/database_write'
require './modules/database_read'

include? DatabaseWrite
include? DatabaseRead
class Movie < Item
  attr_reader :silent
  attr_accessor :movies, :movie_item

  def initialize(publish_date, silent: false)
    super(publish_date)
    @silent = silent
  end

  def list_all_movies
    @movies = read_movies
  end

  def add_new_movie(movie)
    @movie_item << {
      id: movie.id,
      author: movie.author,
      genre: movie.genre,
      source: movie.source,
      label: movie.label
    }
    write_movie(movie_item)
  end

  private

  def can_be_archived?
    super || @silent ? true : false
  end
end
