module HandleMusicAlbums
  FILE_NAME = "./json/music_albums.json".freeze

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
  def add_music_album
    publish_date = user_input("Enter item publish date: ")
    on_spotify = user_input("Is this item on spotify [Y, N]: ").downcase == 'y'

    music_album = MusicAlbum.new(publish_date, on_spotify: on_spotify)
    create_an_item(music_album)
    @music_albums << music_album unless @music_albums.include?(music_album)
  end

  # Load music albums
  # def load_music_albums
  #   File.new(FILE_NAME, "w") unless File.exist?(FILE_NAME)
  #   file = File.read(FILE_NAME)
  #   music_albums = [*JSON.load(file)]
  #   create_music_albums_instance(music_albums)
  # end

  # save music albums
  def save_music_albums
    music_albums = []
    @music_albums.each do |music_album|
      music_albums << {
        publish_date: music_album.publish_date,
        on_spotify: music_album.on_spotify,
        genre: {name: music_album.genre.name},
        author: {first_name: music_album.author.first_name, last_name: music_album.author.last_name},
        source: {name: music_album.source.name},
        label: {title: music_album.label.title, color: music_album.label.color},
      }
    end
    File.write(FILE_NAME, JSON.generate(music_albums))
  end

  private

  # def create_music_albums_instance(music_albums)
  #   music_albums_instances = music_albums.map |music_album| do
  #     # create music album
  #     music_albumn_instance = MusicAlbum.new()
  #     # create music genre
  #     # create music author
  #     # create music label
  #     # create music album
  #   end
  # end
end