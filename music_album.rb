require './item'

class MusicAlbum < Item
  attr_accessor :on_sportify, :genre

  def initialize(publish_date, on_sportify)
    super(publish_date)
    @on_sportify = on_sportify
  end

  def can_be_archived?
    super && @on_sportify
  end

  def add_genre(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end
end
