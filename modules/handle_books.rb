require_relative '../classes/book'

module HandleBooks
  def ui_decorator(str, num)
    puts
    puts '-' * num
    puts str
    puts '-' * num
  end

  def list_books
    ui_decorator('List of Books', 14)
    if @books.empty?
      puts 'No books available'
    else
      @books.each_with_index do |book, index|
        puts "#{index + 1}) ID: #{book.id} Title: #{book.label.title}, Author: #{book.author.first_name} #{book.author.last_name}, Publisher: #{book.publisher}, Published Date: #{book.publish_date}"
      end
    end
  end

  def add_book
    ui_decorator('Add a Book', 11)
    published_date = user_input('When was the book published?(YYYY-MM-DD): ')
    publisher = user_input("What\'s the name of the publisher?: ")
    cover_state = user_input('What is the state of the cover (good/bad)?: ')
    new_book = Book.new(published_date, publisher, cover_state)
    create_an_item(new_book)
    @books << new_book
    puts
    puts 'Book has been added successfully!!'
  end
end
