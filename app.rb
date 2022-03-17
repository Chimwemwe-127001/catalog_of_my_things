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

  def list_all_music_album
    if @music_albums.length.positive?
      puts(@music_albums.map { |al| "[#{al.class.name}] Publish Date: #{al.publish_date}, ID: #{al.id}, on_spotify: #{al.on_spotify}".yellow })
    else
      puts 'No albums in the library yet!'.red
    end
  end

  def list_all_games; end

  def list_all_genres; end

  def list_all_labels; end

  def list_all_authors; end

  def add_book; end

  def add_music_album
    date = one_line_prompt('Date [YYYY/MM/DD]: ').to_i
    input = one_line_prompt('Album on spotify? [Yes/No]: ')
    on_spotify = %w[Yes yes YES].include?(input)
    @music_albums.push(MusicAlbum.new(date, on_spotify: on_spotify))
    f = File.new('./data/music_albums.json', 'w')
    jjn = @music_albums.map { |a| { date: a.publish_date, on_spotify: a.on_spotify } }
    f.puts(JSON.pretty_generate(jjn))
    f.close
    puts 'ALBUM CREATED SUCCESSFULLY'.green
  end

  def add_game; end
end
