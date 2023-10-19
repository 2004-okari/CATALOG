# frozen_string_literal: true

class Storage
  def save_book(books)
    json_books = books.map do |book|
      {
        'publish_date' => book.publish_date,
        'publisher' => book.publisher,
        'cover_state' => book.cover_state
      }
    end
    File.write('data/books.json', JSON.pretty_generate(json_books))
  end

  def save_labels(labels)
    json_labels = labels.map do |label|
      {
        'title' => label.title,
        'color' => label.color
      }
    end
    File.write('data/labels.json', JSON.pretty_generate(json_labels))
  end

  def save_games(games)
    json_games = games.map do |game|
      {
        'publish_date' => game.publish_date,
        'multiplayer' => game.multiplayer,
        'last_played_at' => game.last_played_at
      }
    end
    File.write('data/games.json', JSON.pretty_generate(json_games))
  end

  def save_authors(authors)
    json_authors = authors.map do |author|
      {
        'id' => author.id,
        'full_name' => author.full_name
      }
    end
    File.write('data/authors.json', JSON.pretty_generate(json_authors))
  end

  def save_movies(movies)
    movie_hash = movies.map do |movie|
      {
        id: movie.id,
        publish_date: movie.publish_date,
        silent: movie.silent,
        source: movie.source.name
      }
    end
    File.write('data/movies.json', JSON.pretty_generate(movie_hash))
  end


  def save_sources(sources)
    source_hash = sources.map do |source|
      {
        id: source.id,
        name: source.name
      }
    end
    File.write('data/sources.json', JSON.pretty_generate(source_hash))
  end

  def save_music_album(album)
    json_album = album.map do |album|
      {
        'spotify' => album.on_spotify,
        'genre' => album.genre
      }
    end
    File.write('data/music_album.json', JSON.pretty_generate(json_album))
  end

  def save_genre(genre)
    json_genre = genre[0]
    File.write('data/genre.json', JSON.pretty_generate(json_genre))
  end

end
