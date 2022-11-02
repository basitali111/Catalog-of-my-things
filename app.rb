require './modules/music_albums_module'

class App
  attr_accessor :music_albums

  def initialize
    @music_albums = MusicAlbumsModule.new
  end
end
