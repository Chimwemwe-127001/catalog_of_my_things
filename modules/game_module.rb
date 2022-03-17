require_relative '../classes/game'
require 'json'

module GamesDataController
  def load_games
    file = './json/games.json'
    data = []
    if File.exist?(file) && File.read(file) != ''
      JSON.parse(File.read(file)).each do |element|
        data.push(Game.new(element['multiplayer'], element['last_played_at'], element['publish_date']))
      end
    end
    data
  end

  def save_games
    data = []
    @games.each do |game|
      data.push({ multiplayer: game.multiplayer, last_played_at: game.last_played_at,
                  publish_date: game.publish_date })
    end
    File.write('./json/games.json', JSON.generate(data))
  end
end
