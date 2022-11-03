require './book'
require 'json'
require './label'

class BooksModule
  attr_reader :file_location, :books

  def initialize
    @file_location = 'storage/book.json'
    file = File.open(@file_location)
    @books = file.size.zero? ? [] : JSON.parse(file.read)
    file.close
    @files_location = 'storage/label.json'
    files = File.open(@files_location)
    @labels = files.size.zero? ? [] : JSON.parse(files.read)
    files.close
  end

  def create_book
    puts 'Enter the publisher of the book:'
    publisher = gets.chomp
    puts 'Enter the cover state of the book: (e.g. "good" or "bad")'
    cover_state = gets.chomp
    puts 'Enter the publish date of the book: (e.g. 2022/09/10)'
    publish_date = gets.chomp
    book = Book.new(publisher, cover_state, publish_date)

    label = add_label
    # store book and label
    book = book.to_json
    @books.push(book)

    # store to file
    file = File.open(@file_location, 'w')
    file.write(JSON[@books])
    file.close
    puts 'Book created successfully'
  end

  def add_label
    puts 'Give a label for the book: (e.g. Gift, New...)'
    title = gets.chomp
    puts 'Choose a color for the book\'s label: (e.g. Pink, Black, Gold...)'
    color = gets.chomp

    label = Label.new(title, color)

    label = label.to_json
    @labels.push(label)

    # store to file
    files = File.open(@files_location, 'w')
    files.write(JSON[@labels])
    files.close
  end

  # list all books
  def list_all_books
    if @books.empty?
      puts 'Sorry, the books list is currently empty'
    else
      @books.each do |book|
        puts "Publisher: \"#{book['publisher']}\", Cover-State:\"#{book['cover_state']}\",Publish-Date:#{book['publish_date']}"
      end
    end
  end

  def list_all_labels
    if @labels.empty?
      puts 'Sorry, the labels list is currently empty'
    else
      @labels.each do |label|
        puts "Title: \"#{label['title']}\", Color:#{label['color']}"
      end
    end
  end
end
