# frozen_string_literal: true

require_relative 'movie/addmovie'
require_relative 'movie/displaymovie'
require_relative 'movie/displaysources'
require_relative 'movie/preservemoviesource'
require_relative 'movie/load_movie_source'

module Modules
  include AddMovie
  include DisplayMovie
  include DisplaySources
  include PreserveMovieSource
  include LoadMovieSource

  def save_collections
    save_movies
    save_source
  end

  def load_collections
    load_sources
    load_movies
  end
end
