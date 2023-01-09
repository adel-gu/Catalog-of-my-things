class Item
  # Getter
  attr_reader :genre, :source, :author, :label

  def initialize(publish_date)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
  end

  # Add this item to genre
  def add_genre(genre)
    @genre = genre
    genre.items << self unless genre.items.include?(self)
  end

  def add_author(author)
    @author = author
    author.items << self unless author.items.include?(self)
  end

  def add_source(source)
    @source = source
    source.items << self unless source.items.include?(self)
  end

  def add_label(label)
    @label = label
    label.items << self unless label.items.include?(self)
  end
end
