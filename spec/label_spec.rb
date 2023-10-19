require_relative '../classes/label'
require_relative '../classes/item'

describe Label do
  let(:label) { Label.new('Gift', 'blue') }

  describe '#initialize' do
    it('returns the correct title') do
      expect(label.title).to eq('Gift')
    end

    it('returns the correct color') do
      expect(label.color).to eq('blue')
    end
  end

  describe '#add_item' do
    let(:label) { Label.new('Gift', 'blue') }
    it('adds an item into the label') do
      item = double('item')
      expect(item).to receive(:label=).with(label)

      label.add_item(item)
      expect(label.items).to include(item)
    end
  end
end
