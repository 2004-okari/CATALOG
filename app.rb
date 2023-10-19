# frozen_string_literal: true

require 'json'
require_relative './classes/genre'
require_relative './classes/music_album'
require_relative './classes/game'
require_relative './classes/author'
require_relative './classes/label'
require_relative './classes/movie'
require_relative './classes/source'
require_relative './classes/loading'
require_relative './classes/storage'
require_relative './classes/book'
require_relative './classes/album_genre'

# This contains general information
class App
  def initialize
    @genre = []
    @music_album = []
    @games = []
    @authors = []
    @books = []
    @labels = []
    @movies = []
    @sources = []
    load_data
  end

  include AlbumGenre

  def save_data
    puts 'saving data...'
    Storage.new.save_book(@books)
    Storage.new.save_labels(@labels)
    Storage.new.save_movies(@movies)
    Storage.new.save_sources(@sources)
    Storage.new.save_games(@games)
    Storage.new.save_authors(@authors)
    Storage.new.save_music_album(@music_album)
    Storage.new.save_genre(@genre)
  end

  def load_data
    Saving.new.load_books(@books)
    Saving.new.load_labels(@labels)
    Saving.new.load_games(@games)
    Saving.new.load_authors(@authors)
    Saving.new.load_music_album(@music_album)
    Saving.new.load_genre(@genre)
  end

  def add_book
    puts 'Enter the date of publication(yyyy-mm-dd):'
    publish_date = gets.chomp
    puts 'Enter the publisher\'s name:'
    publisher = gets.chomp
    puts 'Enter the state of the book cover (Good or bad):'
    cover_state = gets.chomp
    puts 'Enter the label title:'
    title = gets.chomp
    puts 'Enter the color of the book'
    color = gets.chomp
    book = Book.new(publish_date, publisher, cover_state)
    label = Label.new(title, color)
    @books.push(book)
    @labels.push(label)
    puts 'You\'ve successfully added a book'
  end

  def list_games
    if @games.empty?
      puts 'No games found.'
    else
      puts 'List of Games:'
      @games.each_with_index do |game, index|
        display_game(game, index)
      end
    end
  end

  def display_game(game, index)
    id_text = "ID: #{game.id}"
    publish_date_text = "Published Date: #{game.publish_date}"
    multiplayer_text = "Multiplayer: #{game.multiplayer ? 'Yes' : 'No'}"
    last_played_text = "Last Played: #{game.last_played_at}"

    puts "#{index + 1}, #{id_text}, #{publish_date_text}, #{multiplayer_text}, #{last_played_text}"
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

  def list_all_books
    puts 'Books unavailable' if @books.empty?
    puts
    @books.each do |book|
      puts "Publish Date: #{book.publish_date}, Publisher: #{book.publisher}, Cover State: #{book.cover_state}"
    end
  end

  def list_all_labels
    puts 'Labels unavailable' if @labels.empty?
    puts
    @labels.each do |label|
      puts "Title: #{label.title}, Author: #{label.color}"
    end
  end

  def add_game
    puts 'Let\'s add a new game'
    publish_date = input_dates('When was the game published(yyyy-mm-dd):')
    multiplayer = input_multiplayer
    last_played = input_dates('When did you last play the game(yyyy-mm-dd):')
    game = Game.new(publish_date, multiplayer, last_played)
    @games.push(game)

    puts 'Hurray! Game created'
  end

  def input_dates(prompt)
    print prompt
    gets.chomp.to_s
  end

  def input_multiplayer
    print 'Is the game a multiplayer game? (Y/N): '
    choice = gets.chomp.downcase
    case choice
    when 'y' then true
    when 'n' then false
    else
      puts 'Invalid choice!'
      exit
    end
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

  def add_movie
    publish_date = input_date
    silent = input_silent
    movie = Movie.new(publish_date, silent: silent)
    @movies << movie
    source_name = input_source_name
    source = @sources.find { |s| s.name == source_name }
    source ||= Source.new(source_name)
    source.add_item(movie)
  end

  def input_source_name
    puts 'Add a source'
    puts 'Enter Source Name'
    gets.chomp
  end

  def input_date
    puts 'Please Enter publish date in following format: yyyy/mm/dd'
    gets.chomp
  end

  def add_sources
    puts 'Add a source'
    puts 'Enter Source Name'
    gets.chomp
  end

  def input_silent
    puts 'Is the movie silent? Press 1 for true, 2 for false'
    silent = gets.chomp.to_i
    while silent.nil? || silent < 1 || silent > 2
      puts 'input number between 1 and 2'
      silent = gets.chomp.to_i
    end

    silent == 1
  end
end
