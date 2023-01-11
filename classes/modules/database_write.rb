require 'json'

module DatabaseWrite
  def write_movie(movies)
    File.write('./json/movies.json', JSON.pretty_generate(movies))
  end
end
