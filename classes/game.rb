require_relative 'item'
require 'date'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at)
    super(id)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    @author = author
  end

  private

  def can_be_archived?
    super && Date.today.year - Date.parse(@last_played_at).year > 2
  end
end
