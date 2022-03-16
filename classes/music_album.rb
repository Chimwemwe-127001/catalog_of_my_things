require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(on_spotify: false)
    super()
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?
    current_year = Time.new.year
    current_year - @publish_date > 10 && @on_spotify == true
  end
end
