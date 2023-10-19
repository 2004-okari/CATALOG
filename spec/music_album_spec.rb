# frozen_string_literal: true

require_relative '../classes/music_album'
require_relative '../classes/item'

describe 'MusicAlbum' do
  context '#can_be_archived' do
    it 'is archived when on Spotify and older than 10 years' do
      current_year = Date.today.year
      publish_year = current_year - 11
      spotify = true
      album = MusicAlbum.new(spotify, 'pop')
      album.publish_date = "#{publish_year}-01-01"
      expect(album.send(:can_be_archived?)).to be true
    end

    it 'is not archived when on Spotify but not older than 10 years' do
      current_year = Date.today.year
      publish_year = current_year - 9
      spotify = true
      album = MusicAlbum.new(spotify, 'hip-hop')
      album.publish_date = "#{publish_year}-01-01"
      expect(album.send(:can_be_archived?)).to be false
    end
  end
end
