require 'date'

class Item
  attr_accessor :publish_date, :archived, :genre, :author, :source, :label
  attr_reader :id

  def initialize(publish_date, archived: false)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archived = archived
    @source = source
    @genre = genre
    @author = author
  end

  def add_label(label)
    @label = label
    label.items << self unless label.items.include?(self)
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
