require_relative './classes/book'
require './classes/game'
require './classes/author'

class App
  def initialize
    @books = []
    @music_albums = []
    @games = []
    @genres = []
    @labels = []
    @authors = []
  end

  def options_cases(user_input)
    case user_input
    when '1'
      list_all_books
    when '2'
      list_all_music_album
    when '3'
      list_all_games
    when '4'
      list_all_genres
    when '5'
      list_all_labels
    when '6'
      list_authors
    when '7'
      add_book
    when '8'
      add_music_album
    when '9'
      add_game
    end
  end

  def list_all_books
    puts 'There are no books yet! Please add books.' if @books.empty?
    @books.each do |book|
      puts "Title: #{book.title}, Publisher: #{book.publisher}, cover_state: #{book.cover_state}, Publish Date: #{book.publish_date}"
    end
    sleep 0.75
  end

  def list_all_music_album; end

  def list_all_games
    puts 'There are no game please try to add one !' if @games.count.zero?
    @games.each do |game|
      puts "#{game.multiplayer}, Last played at: #{game.last_played_at}, Publish date: #{game.publish_date}"
    end
  end

  def list_all_genres; end

  def list_all_labels
    puts 'There are no labels yet!' if @labels.empty?
    @labels.each do |label|
      puts "Title: #{label.title}, Color: #{label.color}"
    end
    sleep 0.75
  end

  def list_all_authors
    @authors.each do |author|
      puts "#{author.first_name} #{author.last_name}"
    end
  end

  def add_book
    print 'Enter the book title: '
    title = gets.chomp

    print 'Enter the book publisher: '
    publisher = gets.chomp

    print 'Enter the book cover state(good or bad): '
    cover_state = gets.chomp

    print 'Date of publish [Enter date in format: (yyyy-mm-dd)]: '
    publish_date = gets.chomp

    book = Book.new(title: title, publisher: publisher, cover_state: cover_state, publish_date: publish_date)
    @books << book
    puts 'Book created successfully'
    sleep 0.75
  end

  def add_music_album; end

  def add_game
    multiplayer, last_played_at = game_input
    publish_date = publish_date_input

    @games << Game.new(multiplayer, last_played_at, publish_date)
    puts 'Game created successfully'
    puts ''
  end

  def add_author
    first_name, last_name = author_input

    @authors << Author.new(first_name, last_name)
    puts 'Author created successfully'
    puts ''
  end

  private

  def game_input
    print 'Multiplayer: '
    multiplayer = gets.chomp

    print 'Last_played_at: '
    last_played_at = gets.chomp.to_i

    [multiplayer, last_played_at]
  end

  def publish_date_input
    print 'Publish_date: '
    gets.chomp.to_i
  end

  def author_input
    print 'First name: '
    first_name = gets.chomp

    print 'Last name: '
    last_name = gets.chomp

    [first_name, last_name]
  end
end
