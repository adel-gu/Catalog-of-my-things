module HandleGenre
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
end