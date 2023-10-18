require_relative './classes/genre'
require_relative './classes/music_album'
require_relative './classes/game'
require_relative './classes/author'
require_relative './classes/book'
require_relative './classes/label'
require_relative './classes/movie'
require_relative './classes/source'

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
    new_music_album = MusicAlbum.new(spotify, genre_name)
    @genre << genre_name unless @genre.include? genre_name
    @music_album << new_music_album
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
      @games.each_with_index do |game, index|
        puts "#{index + 1}, ID: #{game.id}, Published Date: #{game.publish_date}, Multiplayer: #{game.multiplayer ? 'Yes' : 'No'}, Last Played: #{game.last_played_at}"
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
    puts "Lets add a new game\nWhen was the game published(yyyy-mm-dd)"
    publish_date = gets.chomp.to_s
    puts "Is the game a multiplayer game(Yy/Nn)?"
    multiplayer = gets.chomp
    if multiplayer.downcase == 'y'
      multiplayer = true
    elsif multiplayer.downcase == 'n'
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


  def display_all_sources
    @sources.each_with_index do |source, index|
      puts "#{index}) Source Name: #{source.name}"
    end
  end

  def display_all_movies
    @movies.each_with_index do |movie, index|
      puts "#{index}) Silent: #{movie.silent}, Publish Date: #{movie.publish_date} Source: #{movie.source.name}"
    end
  end
end
