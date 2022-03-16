require_relative 'item'

class Genre
    attr_accessor :name
    attr_reader :items
    
    def initialize(date, name)
        super(date)
        @name = name
        @items = []
    end

    def add_item(item)
        @items = Item.new(item)
        @items.genre = self
    end

    def music_album
        @items.select {|song| song.genre == self}
    end
end