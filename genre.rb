class Genre
  attr_accessor :items, :name
  attr_reader :id

  def initialize(name)
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(music_album)
    @items << music_album
    music_album.genre = self
  end
end
