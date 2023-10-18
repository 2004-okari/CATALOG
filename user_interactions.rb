# frozen_string_literal: true

require_relative 'app'

class UserInteractions
  def initialize
    @catalog = App.new
  end

  def run
    puts 'Welcome to the Catalog App!'
    loop do
      show_options
      option = gets.chomp.to_i
      if option == 13
        @catalog.save_data
        break
      end

      call_option(option)
    end
  end

  def show_options
    puts <<~OPTIONS
      Please choose an option by entering a number:
      1 - List all books
      2 - List all music albums
      3 - List all movies
      4 - List all games
      5 - List all genres
      6 - List all labels
      7 - List all authors
      8 - List all sources
      9 - Add a book
      10 - Add a music album
      11 - Add a movie
      12 - Add a game
      13 - Exit
    OPTIONS
  end

  def call_option(option)
    option_lookup = {
      1 => :list_all_books,
      2 => :list_music_album,
      3 => :display_all_movies,
      4 => :list_games,
      5 => :list_genre,
      6 => :list_all_labels,
      7 => :list_authors,
      8 => :display_all_sources,
      9 => :add_book,
      10 => :add_music_album,
      11 => :add_movie,
      12 => :add_game,
      13 => :save_data
    }

    @catalog.public_send(option_lookup[option])
  end
end
