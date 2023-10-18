# frozen_string_literal: true

require_relative './item'

# Music represents an list of music
class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(on_spotify, genre)
    super(genre)
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?
    super && on_spotify
  end
end
