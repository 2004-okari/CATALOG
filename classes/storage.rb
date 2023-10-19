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
    existing_data = []
    existing_data = JSON.parse(File.read('data/movies.json')) if File.exist?('data/movies.json')
    movie_hash = movies.map do |movie|
      { id: movie.id, publish_date: movie.publish_date, silent: movie.silent, source: movie.source.name }
    end
    updated_data = existing_data.concat(movie_hash)
    File.write('data/movies.json', JSON.pretty_generate(updated_data))
  end

  def save_sources(sources)
    existing_data = []

    existing_data = JSON.parse(File.read('data/sources.json')) if File.exist?('data/sources.json')

    source_hash = sources.map do |source|
      {
        id: source.id,
        name: source.name
      }
    end

    updated_data = existing_data.concat(source_hash)

    File.write('data/sources.json', JSON.pretty_generate(updated_data))
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

  def save_genre(genre_item)
    json_genre = genre_item.map do |genre|
      {
        "name" => genre.name
      }
    end
    File.write('data/genre.json', JSON.pretty_generate(json_genre))
  end
end
