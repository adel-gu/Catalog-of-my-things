require_relative './classes/author'
require_relative './classes/genre'
require_relative './classes/label'
require_relative './classes/source'

require_relative "./classes/music_album"

require_relative './modules/handle_music_album'
require_relative './modules/handle_genre'

class App
  include HandleMusicAlbums
  include HandleGenre

  def initialize
    @books = []
    @music_albums = load_music_albums
    @movies = []
    @games = []
    @genres = load_genres
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
    0 - Exit app"
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
    author_last_name = user_input("Enter author last name: ")

    genre_name = user_input("Enter item genre (e.g 'Comedy', 'Thriller'): ")

    sourcer_name = user_input("Enter item source (e.g. 'From a friend', 'Online shop'): ")

    # Creat the needed classes
    label = Label.new(label_title, label_color)
    item.add_label(label)
    @labels << label unless @labels.include?(label)

    author = Author.new(author_first_name, author_last_name)
    item.add_author(author)
    @authors << author unless @authors.include?(author)

    genre = Genre.new(genre_name)
    item.add_genre(genre)
    @genres << genre unless @genres.include?(genre)

    source = Source.new(sourcer_name)
    item.add_source(source)
    @sources << source unless @sources.include?(source)
  end

  def selected_option(options)
    case options
    when '1'
      list_books
    when '2'
      list_all_music_albums
    when '3'
      puts 'List all movies'
    when '4'
      puts 'List all games'
    when '5'
      list_all_genre
    when '6'
      puts 'List all labels'
    when '7'
      puts 'List all authors'
    when '8'
      puts 'List all sources'
    when '9'
      add_book
    when '10'
      add_music_album
    when '11'
      add_movie
    when '12'
      add_game
    when '0'
      puts 'Thanks for using the App!!'
      save_genres
      save_music_albums
      exit
    end
  end
end