class App
  def initialize
    @books = []
    @music_albums = []
    @movies = []
    @games = []
    @genres = []
    @labels = []
    @authors = []
    @sources = []
  end

  def prompt()
    puts
    puts 'Select an option (Enter a number)'
    puts
    puts "
    1 - List all books \n
    2 - List all music albums \n
    3 - List all movies \n
    4 - List of games \n
    5 - List all genres \n
    6 - List all labels \n
    7 - List all authors \n
    8 - List all sources \n
    9 - Add a book \n
    10 - Add a music album \n
    11 - Add a movie \n
    12 - Add a game \n
    00 - Exit app"
  end

  def user_input
    gets.chomp.to_i
  end

  def add_book
    puts 'Book Added Succefully!!'
  end

  def add_music_album
    puts 'Book Added Succefully!!'
  end

  def add_movie
    puts 'Author'
    author = gets.chomp
    puts 'Genre'
    genre = gets.chomp
    puts 'Label'
    label = gets.chomp
    puts 'Source'
    source = gets.chomp
    movie = Movie.new('2022/2/2', silent: true)
    movie.author = author
    movie.genre = genre
    movie.label = label
    movie.source = source
    movie.add_new_movie(movie)
  end

  def add_game
    puts 'Book Added Succefully!!'
  end

  def selected_option(options)
    case options
    when 1
      puts 'List all books'
    when 2
      puts 'List all music albums'
    when 3
      puts 'List all movies'
    when 4
      puts 'List all games'
    when 5
      puts 'List all genres'
    when 6
      puts 'List all labels'
    when 7
      puts 'List all authors'
    when 8
      puts 'List all sources'
    when 9
      add_book
    when 10
      add_music_album
    when 11
      add_movie
    when 12
      add_game
    when 0
      puts 'Thanks for using the App!!'
      exit
    end
  end
end
