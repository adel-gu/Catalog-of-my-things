require_relative './item'

class Author < Item
  attr_accessor :first_name, :last_name, :items, :id

  def initialize(first_name, last_name)
    super(items)
    @id = Random.rand(1..1000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items << item
    item.add_author(self)
  end
end
