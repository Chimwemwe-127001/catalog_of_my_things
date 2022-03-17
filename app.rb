require './classes/music_album'
require './classes/genre'
require_relative 'prompts'
require 'colorize'
require 'json'

class App
  include Prompts

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
    when '1'..'6'
      other_option_cases(user_input)
    when '7'
      add_book
    when '8'
      add_music_album
    when '9'
      add_game
    end
  end

  def other_option_cases(action)
    case action
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
      list_all_authors
    end
  end

  def list_all_books; end

  def list_all_music_album
    if @music_albums.length.positive?
      puts(@music_albums.map do |al|
             "[#{al.class.name}] Publish Date: #{al.publish_date}, ID: #{al.id}, on_spotify: #{al.on_spotify}".yellow
           end)
    else
      puts 'No albums in the library yet!'.red
    end
  end

  def list_all_games; end

  def list_all_genres
    if @genres.length.positive?
      puts(@genres.map { |al| "[#{al.class.name}] #{al.name}, ID: #{al.id}".yellow })
    else
      puts 'No new genres added yet!'.red
    end
  end

  def list_all_labels; end

  def list_all_authors; end

  def add_book; end

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
    genre_storage = @genres.map { |g| { genres: g.name } }
    j.puts(JSON.pretty_generate(genre_storage))
    j.close

    puts 'ALBUM CREATED SUCCESSFULLY'.green
  end

  def add_game; end

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
end
