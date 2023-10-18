require_relative '../classes/genre'
require_relative '../classes/item'

describe 'Genre' do
  let(:genre) { Genre.new('Crime') }

  describe '#initialize' do
    it 'creates a new Genre' do
      expect(genre.name).to eq('Crime')
    end
  end

  describe '#add_item' do
    it 'adds an item to the items list' do
      item = Item.new('Atomic Habits')
      genre.add_item(item)
      expect(genre.items).to include(item)
      expect(item.genre).to eq(genre)
    end
  end

end
