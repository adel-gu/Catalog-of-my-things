require_relative '../classes/author'
require 'json'

module HandleAuthor
  def list_author
    puts "\n No author added" if @authors.empty?
    puts 'Available authors '
    @authors.each_with_index do |author, index|
      puts "#{index}) First-Name: #{author['first_name']} Last-Name: #{author['last_name']}"
    end
  end

  def save_author(current_authors, author_obj)
    author_array = []
    current_authors.each do |author|
      author_array << {
        first_name: author.first_name,
        last_name: author.last_name
      }
    end
    if File.exist?('json/author.json')
      authors = File.read('json/author.json')
      author_data = JSON.parse(authors)

      author_data << {
        first_name: author_obj.first_name,
        last_name: author_obj.last_name
      }
      File.write('json/author.json', JSON.pretty_generate(author_data))
    else
      File.write('json/author.json', JSON.pretty_generate(author_array))
    end
  end

  def load_authors
    authors = []
    if File.exist?('json/author.json')
      file = File.read('json/author.json')
      author_data = JSON.parse(file)

      author_data.each do |author|
        authors << author
      end
    end
    authors
  end

  # module end tag
end
