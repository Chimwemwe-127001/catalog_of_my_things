require './app'

class Main
  def initialize
    @app = App.new
  end

  def run
    action = 0
    while action != 10
      display_actions
      action = gets.chomp.to_i
      @app.handle_action(action)
    end
  end

  def display_actions
    puts
    puts 'Welcome to our application!'
    puts
    puts '1-  List all books'
    puts '2-  List all music albums'
    puts '3-  List of games'
    puts '4-  List all genres'
    puts '5-  List all labels'
    puts '6-  List all authors'
    puts '7-  Add a book'
    puts '8-  Add a music album'
    puts '9-  Add a game'
    puts '10- Exit'
  end
end

main = Main.new
main.run
