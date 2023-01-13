require_relative '../classes/source'
require 'json'
module HandleSource
  def list_sources
    puts 'No sources available' if @movies.empty?
    puts '--------------------------'
    puts 'List of Sources'
    puts '--------------------------'
    @sources.each_with_index do |source, index|
      puts "#{index + 1} Name: #{source['name']}"
    end
  end

  def save_new_source(source)
    @sources = load_source
    @sources << { id: source.id, name: source.name }
    save_source(@sources)
  end

  def load_source
    if File.exist?('./json/sources.json')
      sources = File.open('./json/sources.json')
      data = sources.read
      data.empty? ? [] : JSON.parse(data)
    else
      File.write('./json/sources.json', [])
    end
  end

  def save_source(source)
    File.write('./json/sources.json', JSON.pretty_generate(source))
    load_source
  end
end
