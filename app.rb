require_relative './classes/music_album'

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

  def user_input(msg_to_user)
    print msg_to_user
    gets.chomp
  end

  # Since each item we create needs some form of informations that require creating insntaces from other classes, this method devoted to provide thus data.
  def create_an_item(item)
    label_title = user_input("Enter item label title (e.g. 'Gift', 'New'): ")
    label_color = user_input("Enter item label color: ")

    author_first_name = user_input("Enter author first name: ")
    author_last_name = user_input("Enter author first name: ")

    genre_name = user_input("Enter item gener (eg. 'Comedy', 'Thriller'): ")

    sourcer_name = user_input("Enter item gener ((e.g. 'From a friend', 'Online shop'): ")

    # Creat the needed classes
    label = Label.new(label_title, label_color)
    item.add_label(label)
    @labels << label unless @labels.include?(label)

    author = Author.new(author_first_name, author_last_name)
    item.add_author(author)
    @authors << author unless @authors.include?(author)

    genre = Genre.new(genre_name)
    item.add_genre()
    @genres << genre unless @genres.include?(author)

    source = Source.new(sourcer_name)
    item.add_source
    @sources << source unless @sources.include?(source)
  end

  def add_book
    puts 'Book Added Succefully!!'
  end

  def add_movie
    puts 'Book Added Succefully!!'
  end

  def add_game
    puts 'Book Added Succefully!!'
  end

  def list_all_genres
    # check if genres is empty
    @genres.each_with_index do |genre, index|
      puts "#{index}) Name: #{genre.name}"
    end
  end

  def selected_option(options)
    case options
    when 1
      puts 'List all books'
    when 2
      list_all_music_albums
    when 3
      puts 'List all movies'
    when 4
      puts 'List all games'
    when 5
      list_all_genres
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
