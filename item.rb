require 'date'

class Item
  attr_reader :publish_date, :genre, :author, :source, :label

  def initialize(publish_date)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
  end

  def add_genre(genre)
    @genre = genre
  end

  def add_author(author)
    @author = author
  end

  def add_source(source)
    @source = source
  end

  def add_label(label)
    @label = label
  end

private

  def can_be_archived?
    Date.today.year - @publish_date.to_i > 10
  end

 public
 def move_to_archive?
    @archived = true if can_be_archived?
 end
puts