require 'json'
require_relative 'classes/genre'
require_relative 'classes/music_album'
require_relative 'classes/game'
require_relative 'classes/author'
require_relative 'classes/label'
require_relative 'classes/movie'
require_relative 'classes/source'
require_relative 'classes/loading'
require_relative 'classes/storage'
require_relative 'classes/book'
require_relative 'classes/album_genre'
require_relative 'classes/book_label'
require_relative 'classes/game_author'

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
  include BookLabel
  include GameAuthor

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
    Saving.new.load_genre(@sources)
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
