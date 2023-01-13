require './classes/movie'
require 'json'
module HandleMovie
  def list_movies
    puts 'No movies available' if @movies.empty?
    puts '--------------------------'
    puts 'List of Movies'
    puts '--------------------------'
    @movies.each_with_index do |movie, index|
      puts "#{index + 1} - ID: #{movie['id']} Silent: #{movie['silent']} publish_date: #{movie['publish_date']}"
    end
  end

  def add_movie
    silent = user_input('Enter silent status (Y/N): ')
    silent = silent.downcase
    date_published = user_input('Enter Date Published: ')
    option = silent == 'y'
    new_movie = Movie.new(date_published, silent: option)
    create_an_item(new_movie)
    @movies << {
      id: new_movie.id,
      genre_name: new_movie.genre.name,
      silent: new_movie.silent,
      publish_date: new_movie.publish_date
    }

    save_movie(@movies)
    @movies = load_movies
  end

  def load_movies
    if File.exist?('./json/movies.json')
      movies = File.open('./json/movies.json')
      data = movies.read
      data.empty? ? [] : JSON.parse(data)
    else
      File.write('./json/movies.json', [])
    end
  end

  def save_movie(movies)
    File.write('./json/movies.json', JSON.pretty_generate(movies))
  end
end
