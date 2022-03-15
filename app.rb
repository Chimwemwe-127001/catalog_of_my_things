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

  def list_all_games; end

  def list_all_genres; end

  def list_all_labels; end

  def list_all_authors; end

  def add_book; end

  def add_music_album; end

  def add_game; end
end