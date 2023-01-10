require_relative '../classes/music_album'

describe MusicAlbum do
  before(:each) do
    @music_album = MusicAlbum.new('2010-01-01', on_spotify: true)
  end

  context 'testing the move_to_archive method' do
    it 'should return true if on_spotify true and the published year is over 10 years' do
      expect(@music_album.move_to_archive).to eq true
    end

    it 'should return false if on_spotify false even when the published year is over 10 years' do
      @music_album.on_spotify = false
      expect(@music_album.move_to_archive).to eq false
    end

    it 'should set the archived variable to true if on_spotify true and the published year is over 10 years' do
      @music_album.move_to_archive
      expect(@music_album.archived).to eq true
    end

    it 'should set the archived variable to false if on_spotify false even when the published year is over 10 years' do
      @music_album.on_spotify = false
      @music_album.move_to_archive
      expect(@music_album.archived).to eq false
    end
  end
end
