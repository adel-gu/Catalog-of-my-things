require 'date'
require_relative '../modules/handle_source'

class Item
  include HandleSource
  # Getter
  attr_reader :genre, :source, :author, :label, :archived, :id, :publish_date

  def initialize(publish_date)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archived = false
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
    save_new_source(@source)
  end

  def add_label(label)
    @label = label
    label.items << self unless label.items.include?(self)
  end

  def move_to_archive
    @archived = can_be_archived?
  end

  private

  def can_be_archived?
    current_year = Date.today.year
    current_published_year = Date.parse(@publish_date).year
    current_year - current_published_year > 10
  end
end
