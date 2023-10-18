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

  def load_books(books)
    return unless File.exist?('data/books.json')

    retrieved_books = JSON.parse(File.read('data/books.json'))
    retrieved_books.each do |book_data|
      book = Book.new(book_data['publish_date'], book_data['publisher'], book_data['cover_state'])
      books << book
    end
  end

  def load_sources
    source_hash = []
    return source_hash unless File.exist?('data/source.json')

    source_hash = JSON.parse(File.read('data/source.json'))

    source_hash.each do |source|
      source_obj = Source.new(source['name'])
      source_obj.id = source['id']
      @sources << source_obj
    end
  end

  def load_movies
    movie_hash = []
    return movie_hash unless File.exist?('data/movie.json')

    movie_hash = load_data_from_file('data/movie.json')
    movie_hash.each do |movie|
      movie_obj = Movie.new(movie['publish_date'], silent: movie['silent'])
      movie_obj.id = movie['id']
      source_obj = @sources.find { |source| source.name == movie['source'] }
      movie_obj.add_source(source_obj)
      @movies << movie_obj
    end
  end
end
