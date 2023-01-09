class Item
  # Getter
  attr_reader :genre

  def initialize(publish_date)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
  end

  # Add this item to genre
  def add_genre(genre)
    @genre = genre
    genre.items << self unless genre.items.include?(self)
  end
end