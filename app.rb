require './modules/music_albums_module'
require './modules/books_module'
class App
  attr_accessor :books, :music_albums

  def initialize
    @books = BooksModule.new
    @music_albums = MusicAlbumsModule.new
  end
end
