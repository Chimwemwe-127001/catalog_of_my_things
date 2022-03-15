class Label
  attr_accessor :title, :color
  attr_reader :id, :items

  def initialize(title:, color:)
    @id = Random.rand(1..1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.genre = self
  end
end
