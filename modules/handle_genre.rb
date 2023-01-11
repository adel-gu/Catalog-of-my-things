require 'json'

module HandleGenre
  FILE_NAME = "./json/genres.json".freeze

  # List all genres
  def list_all_genre
    if @genres.empty?
      puts "No Genre to be displayed!!"
    else
      @genres.each_with_index do |genre, index|
        puts "#{index}) Genre: #{genre.name}"
      end
    end
  end

  # Load genres

  # Save genres
  def save_genres
    genres = []
    @genres.each do |genre|
      genres << {
        name: genre.name
      }
    end
    File.write(FILE_NAME, JSON.generate(genres))
  end
end