#!/usr/bin/env ruby
require './app'

class Main
  def initialize
    @app = App.new
  end

  def options
    puts
    puts 'Welcome to our application!'
    puts
    puts '1  -  List all books'
    puts '2  -  List all music albums'
    puts '3  -  List of games'
    puts '4  -  List all genres (e.g "Comedy","Thriller")'
    puts '5  -  List all labels (e.g. "Gift", "New")'
    puts '6  -  List all authors (e.g. "Stephen King")'
    puts '7  -  Add a book'
    puts '8  -  Add a music album'
    puts '9  -  Add a game'
    puts '10 -  Exit'
  end

  def run
    input = 0
    while input.to_i < 10
      options
      input = gets.chomp
      @app.options_cases(input)
    end
    puts 'Thank you for using our application'
  end
end

main = Main.new
main.run
