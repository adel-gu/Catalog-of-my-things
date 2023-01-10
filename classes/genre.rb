require_relative './item'

class Genre
  # Getters
  attr_reader :name
  attr_accessor :items

  def initialize(name)
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_items(item)
    item.add_genre(self)
    @items << item unless @items.include?(item)
  end
end
