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

  def handle_action(option)
    action_input = { 1 => list_all_books, 2 => list_all_music_album, 3 => list_all_games, 4 => list_all_genres,
                     5 => list_all_labels, 6 => list_all_authors, 7 => add_book, 8 => add_music_album, 9 => add_game }
    case option
    when 1..9
      action_input[option]
    else
      puts 'Please put a number between 1 and 10'
    end
  end

  def list_all_books; end

  def list_all_music_album; end

  def list_all_games
    puts 'There are no game please try to add one !' if @games.count.zero?
    @games.each do |game|
      puts "#{game.multiplayer}, Last played at: #{game.last_played_at}, Publish date: #{game.publish_date}"
    end
  end

  def list_all_genres; end

  def list_all_labels; end

  def list_all_authors
    @authors.each do |author|
      puts "#{author.first_name} #{author.last_name}"
    end
  end

  def add_book; end

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
