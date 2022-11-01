require './start'

def main
  start = Start.new
  puts 'Welcome to Catalog of my things'
  loop do
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all music album'
    puts '3 - List all games'
    puts '4 - List all genres'
    puts '5 - List all labels'
    puts '6 - List all authors'
    puts '7 - Add a book'
    puts '8 - Add music album'
    puts '9 - Add game'
    puts '10 - Exit'
    selection = gets.chomp.to_i
    if selection == 10
      puts 'Thank you for using the Catalog!'
      break
    end
    start.start_app(selection)
  end
end

main