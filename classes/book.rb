# frozen_string_literal: true

require_relative './item'

# This is Book class
class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publish_date, publisher, cover_state, archived: false)
    super(publish_date, archived: archived)
    @publisher = publisher
    @cover_state = cover_state
  end

  def bad_cover?
    @cover_state == 'bad'
  end

  private

  def can_be_archived?
    super || bad_cover?
  end
end
