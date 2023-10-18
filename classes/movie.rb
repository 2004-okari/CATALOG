require_relative 'source'
require_relative 'item'

class Movie < Item
  attr_accessor :archived, :silent

  def initialize(publish_date, silent:, id: nil)
    super(publish_date)
    @silent = silent
  end

  def can_be_archived?
    super && @silent
  end
end