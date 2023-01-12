require 'json'
require_relative '../classes/book'
require_relative '../modules/handle_labels'

module HandleBooks
  include HandleLabels

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
        puts "#{index + 1}) ID: #{book['id']} Title: #{book['label']['title']}, Author: #{book['author']['first_name']} #{book['author']['last_name']}, Publisher: #{book['publisher']}, Published Date: #{book['publish_date']}"
      end
    end
  end

  # add book to books array
  def add_book
    books = []
    ui_decorator('Add a Book', 11)
    published_date = user_input('When was the book published?(YYYY-MM-DD): ')
    publisher = user_input("What's the name of the publisher?: ")
    cover_state = user_input('What is the state of the cover (good/bad)?: ')
    new_book = Book.new(published_date, publisher, cover_state)
    create_an_item(new_book)
    books << new_book
    save_book(books, new_book)
    @books = load_books
    @labels = load_labels
    puts
    puts 'Book has been added successfully!!'
  end

  # save to file
  def save_book(curr_books, book_obj)
    book_array = []
    curr_books.each do |book|
      book_array << {
        id: book.id,
        publish_date: book.publish_date,
        publisher: book.publisher,
        cover_state: book.cover_state,
        label: {
          id: book.label.id,
          title: book.label.title,
          color: book.label.color
        },
        genre: {
          id: book.genre.id,
          name: book.genre.name
        },
        author: {
          id: book.author.id,
          first_name: book.author.first_name,
          last_name: book.author.last_name
        },
        source: {
          id: book.source.id,
          name: book.source.name
        }
      }
    end

    if Dir.exist?('json') && File.exist?('json/books.json')
      books = File.read('json/books.json')
      books_data = JSON.parse(books)
      books_data << {
        id: book_obj.id,
        publish_date: book_obj.publish_date,
        publisher: book_obj.publisher,
        cover_state: book_obj.cover_state,
        label: {
          id: book_obj.label.id,
          title: book_obj.label.title,
          color: book_obj.label.color
        },
        genre: {
          id: book_obj.genre.id,
          name: book_obj.genre.name
        },
        author: {
          id: book_obj.author.id,
          first_name: book_obj.author.first_name,
          last_name: book_obj.author.last_name
        },
        source: {
          id: book_obj.source.id,
          name: book_obj.source.name
        }
      }
      File.write('json/books.json', JSON.pretty_generate(books_data))
    elsif Dir.exist?('json') && !File.exist?('json/books.json')
      File.write('json/books.json', JSON.pretty_generate(book_array))
    else
      Dir.mkdir('json')
      File.write('json/books.json', JSON.pretty_generate(book_array))
    end
  end

  # load books on app start
  def load_books
    book_array = []
    return book_array unless Dir.exist?('json') && File.exist?('json/books.json')

    books = File.read('json/books.json')
    books_data = JSON.parse(books)
    books_data.each do |book|
      book_array << book
    end
    book_array
  end
end
