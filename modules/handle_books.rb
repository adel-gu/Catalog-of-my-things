require_relative '../classes/book'

module HandleBooks
  def ui_decorator(str, num)
    puts '-' * num
    puts str
    puts '-' * num
  end

  def add_book
    ui_decorator('Add a Book', 11)
    published_date = user_input('When was the book published?(YYYY-MM-DD): ')
    publisher = user_input("What\'s the name of the publisher?: ")
    cover_book = user_input('What is the state of the cover (good/bad)?: ')
    new_book = Book.new(publish_date, publisher, cover_state)
    create_an_item(new_book)
  end
end
