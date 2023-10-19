class App

  def add_book
    puts 'Enter the date of publication(yyyy-mm-dd):'
    publish_date = gets.chomp
    puts 'Enter the publisher\'s name:'
    publisher = gets.chomp
    puts 'Enter the state of the book cover (Good or bad):'
    cover_state = gets.chomp
    book = Book.new(publish_date, publisher, cover_state)
    @books.push(book)
    puts 'You\'ve successfully added a book'
  end
end
