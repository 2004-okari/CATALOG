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
end
