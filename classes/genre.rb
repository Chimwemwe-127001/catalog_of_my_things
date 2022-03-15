class Genre
    attr_accessor :name
    def initialize(date, name)
        super(date)
        @name = name
        @items = []
    end
end