require './classes/music_album'

describe MusicAlbum do
  before :each do
    @music_album = MusicAlbum.new(2010, true)
  end

  it 'should detect the music_album publish_date' do
    expect(@music_album.publish_date).to eq 2010
  end

  it 'should detect the music_album on_spotify' do
    expect(@music_album.on_spotify).to be true
  end

  context 'Testing can_be_archived?' do
    it 'should return true' do
      expect(@music_album.send(:can_be_archived?)).to be true
    end

    it 'should return false' do
      @music_album.on_spotify = false
      expect(@music_album.send(:can_be_archived?)).to be false
    end
  end
end
