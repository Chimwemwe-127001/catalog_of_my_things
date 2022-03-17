require_relative './classes/book'
require './classes/game'
require './classes/author'
require './classes/lable'
require './classes/music_album'
require './classes/genre'
require './modules/book_module'
require './modules/label_module'
require './modules/game_module'
require './modules/author_module'
require_relative 'prompts'
require 'json'

class App
  include Prompts
  include LabelsDataController
  include BooksDataController
  include GamesDataController
  include AuthorsDataController

  def initialize
    @books = load_books
    @music_albums = []
    @games = load_games
    @genres = []
    @labels = load_labels
    @authors = load_authors
  end

  def list_all_books
    puts 'There are no books yet! Please add books.' if @books.empty?
    @books.each do |book|
      puts "Title: #{book.title}, Publisher: #{book.publisher}"
      puts "cover_state: #{book.cover_state}, Publish Date: #{book.publish_date}"
    end
    sleep 0.75
  end

  def list_all_music_album
    if @music_albums.length.positive?
      puts(@music_albums.map do |al|
             "[#{al.class.name}] Publish Date: #{al.publish_date}, ID: #{al.id}, on_spotify: #{al.on_spotify}".yellow
           end)
    else
      puts 'No albums in the library yet!'.red
    end
  end

  def list_all_games
    puts 'There are no games please try to add one !' if @games.count.zero?
    @games.each do |game|
      puts "#{game.multiplayer}, Last played at: #{game.last_played_at}, Publish date: #{game.publish_date}"
    end
  end

  def list_all_genres
    if @genres.length.positive?
      puts(@genres.map { |al| "[#{al.class.name}] #{al.name}, ID: #{al.id}".yellow })
    else
      puts 'No new genres added yet!'.red
    end
  end

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

  def add_music_album
    date = one_line_prompt('Date [YYYY]: ').to_i
    album_genre = one_line_prompt('Genre: ')
    input = one_line_prompt('Album on spotify? [Yes/No]: ')
    on_spotify = %w[Yes yes YES].include?(input)
    @music_albums.push(MusicAlbum.new(date, on_spotify: on_spotify))
    @genres.push(Genre.new(album_genre))

    f = File.new('./json/music_albums.json', 'w')
    album_storage = @music_albums.map { |a| { date: a.publish_date, on_spotify: a.on_spotify } }
    f.puts(JSON.pretty_generate(album_storage))
    f.close

    j = File.new('./json/genres.json', 'w')
    genre_storage = @genres.map { |g| { name: g.name } }
    j.puts(JSON.pretty_generate(genre_storage))
    j.close

    puts 'ALBUM CREATED SUCCESSFULLY'.green
  end

  def load_album_genre
    if File.exist?('./json/music_albums.json')
      file = File.read('./json/music_albums.json')
      data_hash = JSON.parse(file)
      data_hash.map do |alb|
        @music_albums.push(MusicAlbum.new(alb['date'], on_spotify: alb['on_spotify']))
      end
    else
      puts 'No albums in the library yet!'.red
    end
    if File.exist?('./json/genres.json')
      file = File.read('./json/genres.json')
      genre_data = JSON.parse(file)
      genre_data.map do |gen|
        @genres.push(Genre.new(gen['name']))
      end
    else
      puts 'No new genres added yet!'.red
    end
  end

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

  def add_label
    print 'Enter the Label title: '
    title = gets.chomp

    print 'Enter the Label color: '
    color = gets.chomp

    @labels << Label.new(title: title, color: color)
    puts 'Label created successfully'
    sleep 0.75
  end
end
