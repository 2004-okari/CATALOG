# frozen_string_literal: true

# This is item.rb

class Item
  attr_accessor :genre, :author, :source, :label, :publish_date
  attr_reader :id

  def initialize(publish_date)
    @id = Random.rand(1..1000)
    @genre = genre
    @source = source
    @label = label
    @publish_date = publish_date
    @archived = false
  end

  def add_author(author)
    @author = author
    author.items << self unless author.items.include?(self)
  end

  def move_to_archive
    return unless can_be_archived?

    self.archived = true
  end

  private

  def can_be_archived?
    current_year = Date.today.year
    publish_year = Date.parse(@publish_date).year
    current_year - publish_year > 10
  end
end
