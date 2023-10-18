# frozen_string_literal: true

require_relative '../classes/book'

describe Book do
  describe '#initialize' do
    let(:book) { Book.new('2010-02-02', 'Penguin', 'bad') }
    it('returns the correct publisher') do
      expect(book.publisher).to eq('Penguin')
    end

    it('returns true if the cover_state is bad') do
      expect(book.cover_state).to eq('bad')
    end
  end

  describe '#bad_cover?' do
    let(:book) { Book.new('2010-02-02', 'Penguin', 'bad') }
    it('returns true if cover_state is bad') do
      expect(book.bad_cover?).to eq(true)
    end
  end

  describe '#bad_cover?' do
    let(:book) { Book.new('2020-02-02', 'Penguin', 'good') }
    it('returns false if cover_state is good') do
      expect(book.bad_cover?).to eq(false)
    end
  end
end
