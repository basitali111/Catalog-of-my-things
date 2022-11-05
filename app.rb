require './modules/music_albums_module'
require './modules/books_module'
require './modules/games_module'

class App
  attr_accessor :books, :music_albums, :games

  def initialize
    @books = BooksModule.new
    @music_albums = MusicAlbumsModule.new
    @games = GamesModule.new
  end
end
