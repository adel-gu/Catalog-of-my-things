module HundleMusicAlbums
  # List music albums
  def list_all_music_albums
    @music_albums.each_with_index do |music_album, index|
      puts "#{index}) Label: #{music_album.label.title} Author: #{music_album.author.first_name}, #{music_album.author.last_name} Genre: #{music_album.genre.name}, Publish Date: #{music_album.publish_date}"
      puts
    end
  end

  # Add music album
  def add_music_album
    publish_date = user_input("Enter item publish date: ")
    on_spotify = user_input("Is this item on spotify [true, false]: ")

    music_album = MusicAlbum.new(publish_date, on_spotify: on_spotify)
    create_an_item(music_album)
    @music_albums << music_album unless @music_albums.include?(music_album)
  end

  # save music albums

  # Load music albums
end