require_relative '../classes/genre'
require_relative '../classes/music_album'

class App
  def initialize
    @genre = []
    @music_album = []
  end

  def list_genre
    if @genre.empty?
      puts "No genres found. Add a genre"
    else
      @genre.each_with_index do |genre, index|
        puts "#{index + 1}) Genre: \"#{genre}\""
      end
    end
  end

  def list_music_album
    if @music_album.empty?
      puts "No music albums found. Add a music album"
    else
      @music_album.each_with_index do |album, index|
        puts "#{index + 1}) Music Album: \"#{album}\""
      end
    end
  end

  def add_music_album
    print 'Is it on Spotify(Y/N): '
    spotify = gets.chomp
    if spotify.lowercase == 'y'
      spotify = true
    elsif spotify.lowercase == 'n'
      spotify = false
    else
      print 'Invalid answer'
      exit
    end
    puts "What's the genre?: "
    genre_name = gets.chomp
    new_genre = MusicAlbum.new(spotify, genre_name)
    print 'Music album created!'
  end

end