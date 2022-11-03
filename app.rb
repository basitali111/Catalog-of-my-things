require './modules/books_module'
class App
  attr_accessor :books

  def initialize
    @books = BooksModule.new
  end
end
