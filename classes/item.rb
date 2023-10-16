# frozen_string_literal: true

class Item
  attr_accessor :genre, :author, :source, :label, :publish_date, :archived
  attr_reader :id

  def initialize(genre, author, source, label, publish_date)
    @id = Random.rand(1..1000)
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
    @archived = false
  end

  def can_be_archived?
    ten_years = Time.now - (10 * 365 * 24 * 60 * 60)
    @publish_date > ten_years
  end

  def move_to_archive
    return unless can_be_archived?

    self.archived = true
  end
end
