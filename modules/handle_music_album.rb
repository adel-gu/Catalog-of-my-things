module HandleMusicAlbums
  # List music albums
  def list_all_music_albums
    if @music_albums.empty?
      puts "No music album to display!!"
    else
      @music_albums.each_with_index do |music_album, index|
        puts "#{index}) Label: #{music_album.label.title} | Author: #{music_album.author.first_name},#{music_album.author.last_name} | Genre: #{music_album.genre.name} | Publish Date: #{music_album.publish_date}"
        puts
      end
    end
  end

  # Add music album

  # save music albums

  # Load music albums
end