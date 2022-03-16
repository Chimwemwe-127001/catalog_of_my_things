require_relative './classes/book'

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

  def list_all_games; end

  def list_all_genres; end

  def list_all_labels
    puts 'There are no labels yet!' if @labels.empty?
    @labels.each do |label|
      puts "Title: #{label.title}, Color: #{label.color}"
    end
    sleep 0.75
  end

  def list_all_authors; end

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

  def add_game; end
end
