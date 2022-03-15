class MusicAlbum

    attr_accessor :on_spotify

  def initialize(on_spotify: false)
    @on_spotify = on_spotify
  end
end