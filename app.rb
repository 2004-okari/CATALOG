require_relative '../classes/genre'
require_relative '../classes/music_album'
require_relative './classes/book'

class App
  def initialize
    @genre = []
    @music_album = []
    @games = []
    @authors = []
    @books = []
    @labels = []
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

  def add_book
    create_book
    puts 'You\'ve successfully added a book'
  end

  def create_book(book)
    puts 'Date published (dd/mm/yy):'
    publish_date = gets.chomp
    puts 'Publisher\'s name:'
    publisher = gets.chomp
    puts 'State of book cover (Good or bad):'
    cover_state = gets.chomp
    books = Book.new(publish_date, publisher, cover_state)
  end

  def list_games
    if @games.empty?
      puts 'No games found.'
    else
      puts 'List of Games:'
      @games.each do |game|
        puts "ID: #{game.id}, Title: #{game.title}"
      end
    end
  end

  def list_authors
    if @authors.empty?
      puts 'No authors found.'
    else
      puts 'List of Authors:'
      @authors.each do |author|
        puts "ID: #{author.id}, Name: #{author.full_name}"
      end
    end
  end

  def list_all_books(books)
    puts 'Books unavailable' if books.empty?
    puts
    books.each do |book|
      puts "Publish Date: #{book.publish_date}, Publisher: #{book.publisher}, Cover State: #{book.cover_state}"
    end
  end

  def list_all_labels(labels)
    puts 'Labels unavailable' if labels.empty?
    puts
    labels.each do |label|
      puts "Title: #{label.title}, Author: #{label.color}"
    end
  end

  def add_game
    puts "Lets add a new game(yyyy-mm-dd)"
    publish_date = gets.chomp.to_s
    puts "Is the game a multiplayer game(Yy/Nn)?"
    multiplayer = gets.chomp
    if multiplayer.lowercase == 'y'
      multiplayer = true
    elsif multiplayer.lowercase == 'n'
      multiplayer = false
    else
      puts 'Invalid choice!'
      exit
    end
    puts "When did you last play the game(yyyy-mm-dd)"
    last_played = gets.chomp.to_s
    game = Game.new(publish_date, multiplayer, last_played)
    @games.push(game)
    puts "Hurray! Game created"
  end
end
