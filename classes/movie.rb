require_relative './item'
class Movie < Item
  attr_reader :silent

  def initialize(publish_date, silent: false)
    super(publish_date)
    @silent = silent
  end

  # private

  def can_be_archived?
    super || @silent ? true : false
  end
end
