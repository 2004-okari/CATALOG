# frozen_string_literal: true

require 'rspec'
require_relative '../classes/author'
require_relative '../classes/item'

describe Author do
  context 'Author class' do
    author = Author.new('Robert', 'Greene')
    it 'Should create new author with those arguments' do
      expect(author).to be_an_instance_of(Author)
    end
    it 'Should return correct first name' do
      expect(author.first_name).to eq 'Robert'
    end
    it 'Should return correct correct' do
      expect(author.last_name).to eq 'Greene'
    end
    it 'Should return correct items' do
      expect(author.items).to eq []
    end
  end
end
