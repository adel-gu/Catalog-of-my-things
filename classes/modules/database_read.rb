require 'json'

module DatabaseRead
  def read_movies
    if File.exist?('./JSON/movies.json')
      movies = File.open('./JSON/movies.json')
      data = movies.read
      JSON.parse(data)
    else
      File.write('./JSON/movies.json', [])
    end
  end

  def read_sources
    if File.exist?('./JSON/sources.json')
      movies = File.open('./JSON/sources.json')
      data = movies.read
      JSON.parse(data)
    else
      File.write('./JSON/sources.json', [])
    end
  end
end
