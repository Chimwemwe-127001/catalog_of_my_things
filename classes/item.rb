class Item
  attr_reader :genre, :author, :label, :source
  attr_accessor :publish_date

  def initialize(date, label = "n/a", author = "n/a", 
    genre = "n/a", source = "n/a", archived: false)

    @id = Random.rand(1..500)
    @author = author
    @label = label
    @genre = genre
    @source = source
    @publish_date = date
    @archived = archived
  end

  def genre=(genre)
    @genre = genre
    @genre.add_item(self) unless @genre.items.include?(self)
  end

  def author=(author)
    @author = author
    @author.add_item(self) unless @author.items.include?(self)
  end

  def label=(label)
    @label = label
    @label.add_item(self) unless @label.items.include?(self)
  end

  def source=(source)
    @source = source
    @source.add_item(self) unless @source.items.include?(self)
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    current_year = Time.new.year
    current_year - @publish_date > 10
  end
end
