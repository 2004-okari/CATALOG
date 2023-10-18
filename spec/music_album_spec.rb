# frozen_string_literal: true

require_relative '../classes/music_album'
require_relative '../classes/item'

describe 'MusicAlbum' do
  context '#can_be_archived' do
    it 'is archived when on Spotify' do
      album = MusicAlbum.new(true)
      Item.new(Date.new(2010, 1, 1))
      expect(album.send(:can_be_archived?)).to be true
    end

    it 'is not archived when not on Spotify' do
      album = MusicAlbum.new(false)
      expect(album.send(:can_be_archived?)).to be false
    end
  end
end
