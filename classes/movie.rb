# frozen_string_literal: true

require_relative 'source'
require_relative 'item'

# Movie represents an list of movies
class Movie < Item
  attr_accessor :archived, :silent

  def initialize(publish_date, silent:)
    super(publish_date)
    @silent = silent
  end

  def can_be_archived?
    super && @silent
  end
end
