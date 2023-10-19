module AlbumGenre
  def list_genre
    if @genre.empty?
      puts 'No genres found. Add a genre'
    else
      @genre.each_with_index do |genre, index|
        puts "#{index + 1}) Genre: \"#{genre.name}\""
      end
    end
  end

  def list_music_album
    if @music_album.empty?
      puts 'No music albums found. Add a music album'
    else
      @music_album.each_with_index do |album, index|
        if album.on_spotify
          puts "#{index + 1}) Music Album: On Spotify, Genre => \"#{album.genre}\""
        else
          puts "#{index + 1}) Music Album: Not on Spotify, Genre => \"#{album.genre}\""
        end
      end
    end
  end

  def add_music_album
    print 'Is it on Spotify(Y/N): '
    spotify = gets.chomp
    if spotify.downcase == 'y'
      spotify = true
    elsif spotify.downcase == 'n'
      spotify = false
    else
      print 'Invalid answer'
      exit
    end
    puts "What's the genre?: "
    genre_name = gets.chomp
    new_genre = Genre.new(genre_name)
    new_music_album = MusicAlbum.new(spotify, genre_name)
    @genre << new_genre unless @genre.include? new_genre
    @music_album << new_music_album
    print 'Music album created!'
  end
end
