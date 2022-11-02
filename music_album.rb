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

  def to_json(*_args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'genre' => @genre,
      'author' => @author,
      'publication_date' => @publish_date,
      'on_sportify' => @on_sportify
    }
  end
end
