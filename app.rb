class App
  def prompt()
    puts 'Select an option (Enter a number)'
    puts
    puts "
    1 - List all books \n
    2 - List all music albums \n
    3 - List all movies \n
    4 - List of games \n
    5 - List all genres (e.g 'Comedy', 'Thriller') \n
    6 - List all labels (e.g. 'Gift', 'New') \n
    7 - List all authors (e.g. 'Stephen King') \n
    8 - List all sources (e.g. 'From a friend', 'Online shop') \n
    9 - Add a book \n
    10 - Add a music album \n
    11 - Add a movie \n
    12 - Add a game \n "
  end

  def get_input
    gets.chomp.to_i
  end
end
