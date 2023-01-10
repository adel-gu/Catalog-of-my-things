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
    12 - Add a game \n
    00 - Exit app"
  end

  def get_input
    gets.chomp.to_i
  end

  def selected_option(options)
    case options
    when 1
      #dispaly all books
    when 2
      #List all music
    when 3

    when 4

    when 5
      
    when 6

    when 7

    when 8
    
    when 9

    when 10

    when 11

    when 12

    when 0
      exit
    else
      #call the prompt again
    end
  end
end
