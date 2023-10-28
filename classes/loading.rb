# This is item.rb it reps an item class
class Saving
  def load_labels(labels)
    return unless File.exist?('data/labels.json')

    retrieved_labels = JSON.parse(File.read('data/labels.json'))
    retrieved_labels.each do |label|
      labels << Label.new(label['title'], label['color'])
    end
  end

  def load_music_album(music_album)
    return unless File.exist?('data/music_album.json')

    retrieved_album = JSON.parse(File.read('data/music_album.json'))
    retrieved_album.each do |album|
      music_album << MusicAlbum.new(album['spotify'], album['genre'])
    end
  end

  def load_genre(genres)
    return unless File.exist?('data/genre.json')

    retrieved_genre = JSON.parse(File.read('data/genre.json'))
    retrieved_genre.each do |genre|
      genres << Genre.new(genre['name'])
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

  def load_games(games)
    return unless File.exist?('data/games.json')

    retrieved_games = JSON.parse(File.read('data/games.json'))
    retrieved_games.each do |game_data|
      game = Game.new(game_data['publish_date'], game_data['multiplayer'], game_data['last_played_at'])
      games << game
    end
  end

  def load_authors(authors)
    return unless File.exist?('data/authors.json')

    retrieved_authors = JSON.parse(File.read('data/authors.json'))
    retrieved_authors.each do |author_data|
      author = Author.new(author_data['first_name'], author_data['last_name'])
      authors << author
    end
  end

  def load_sources(sources)
    return unless File.exist?('data/sources.json')

    source_hash = JSON.parse(File.read('data/sources.json'))
    source_hash.each do |source|
      source_obj = Source.new(source['name'])
      source_obj.id = source['id']
      sources << source_obj
    end
  end

  def load_movies(movies)
    return unless File.exist?('data/movies.json')

    movie_hash = JSON.parse(File.read('data/movies.json'))
    movie_hash.each do |movie|
      movie_obj = Movie.new(movie['publish_date'], silent: movie['silent'])
      movie_obj.id = movie['id']
      source_obj = @sources.find { |source| source.name == movie['source'] }
      movie_obj.add_source(source_obj)
      movies << movie_obj
    end
  end
end
