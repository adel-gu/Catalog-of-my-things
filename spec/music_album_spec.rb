require_relative '../classes/music_album'

describe MusicAlbum do
  before(:each) do
     @musicAlbum = MusicAlbum.new("2010-01-01", true)
  end

  context "testing the move_to_archive method" do
    it 'should return true if on_spotify true' do
      expect(@musicAlbum.move_to_archive).to eq true
    end

    it 'should return false if on_spotify false' do
      @musicAlbum.on_spotify = false
      expect(@musicAlbum.move_to_archive).to eq false
    end
  end
end