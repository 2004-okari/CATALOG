class Saving
  def load_labels(labels)
    return unless File.exist?('data/labels.json')

    retrieved_labels = JSON.parse(File.read('data/labels.json'))
    retrieved_labels.each do |label|
      labels << Label.new(label['title'], label['color'])
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
end
