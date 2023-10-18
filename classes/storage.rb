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

  def save_movies
    movie_hash = @movies.map do |movie|
      {
        id: movie.id,
        publish_date: movie.publish_date,
        silent: movie.silent,
        source: movie.source.name
      }
    end
    File.write('data/movie.json', JSON.pretty_generate(movie_hash))
  end

  def save_source
    source_hash = @sources.map do |source|
      {
        id: source.id,
        name: source.name
      }
    end
    File.write('data/source.json', JSON.pretty_generate(source_hash))
  end
end
