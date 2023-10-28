# Soucr represents a list of sources
class Source
  attr_accessor :name, :id
  attr_reader :items

  def initialize(name, id = nil)
    @id = id || Random.rand(1..100)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.add_source(self)
  end
end
