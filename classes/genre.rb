# Genre represents an genre of items
class Genre
  attr_accessor :items, :name
  attr_reader :id

  def initialize(name)
    @id = Random.rand(1..100)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self
  end
end
