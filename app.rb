require_relative '../classes/genre'
require_relative '../classes/music_album'

class App
  def initialize
    @genre = []
    @music_album = []
  end

  def list_genre
    if @genre.empty?
      puts "No genre found. Add a genre"
    else
      @genre.each_with_index do |genre, index|
        puts "#{index + 1}) Genre: \"#{genre}\""
      end
    end
  end
end