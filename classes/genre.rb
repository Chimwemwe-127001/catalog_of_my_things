require './item'
require_relative 'music_album'

class Genre
  attr_accessor :name
  attr_reader :items, :id

  def initialize(name)
    @id = Random.rand(1..500)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self
  end

  def music_album
    @items.each do |song| 
        if song.genre == self
        return song.move_to_archive, @id , song.genre.name 
        end
    end
  end
end
