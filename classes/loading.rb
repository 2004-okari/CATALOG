# frozen_string_literal: true

class Saving
  def load_labels(labels)
    return unless File.exist?('data/labels.json')

    retrieved_labels = JSON.parse(File.read('data/labels.json'))
    retrieved_labels.each do |label|
      labels << Label.new(label['title'], label['color'])
    end
  end

  def load_music_album(album)
    return unless File.exist?('data/music.json')

    retrieved_books = JSON.parse(File.read('data/music.json'))
    retrieved_books.each do |_book|
      music_album << MusicAlbum.new(album['spotify'], album['genre'])
    end
  end
end
