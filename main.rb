#!/usr/bin/env ruby
require './app'
require 'colorize'

class Main
  def initialize
    @app = App.new
  end

  def options
    puts
    puts 'Welcome to our application!'.yellow
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

  def options_cases(user_input)
    case user_input
    when '1'..'6'
      other_option_cases(user_input)
    when '7'
      @app.add_book
    when '8'
      @app.add_music_album
    when '9'
      @app.add_game
    end
  end

  def other_option_cases(action)
    case action
    when '1'
      @app.list_all_books
    when '2'
      @app.list_all_music_album
    when '3'
      @app.list_all_games
    when '4'
      @app.list_all_genres
    when '5'
      @app.list_all_labels
    when '6'
      @app.list_all_authors
    end
  end

  def run
    input = 0
    @app.load_album_genre
    while input.to_i < 10
      options
      input = gets.chomp
      options_cases(input)
    end
    @app.save_books
    @app.save_labels
    @app.save_games
    @app.save_authors
    puts 'Thank you for using our application'.yellow
  end
end

main = Main.new
main.run
