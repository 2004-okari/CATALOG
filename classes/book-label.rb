# frozen_string_literal: true

# This is book-label.rb it reps an item class
module BookLabel
  def add_book
    puts 'Enter the date of publication(yyyy-mm-dd):'
    publish_date = gets.chomp
    puts 'Enter the publisher\'s name:'
    publisher = gets.chomp
    puts 'Enter the state of the book cover (Good or bad):'
    cover_state = gets.chomp
    puts 'Enter the label title:'
    title = gets.chomp
    puts 'Enter the color of the book'
    color = gets.chomp
    book = Book.new(publish_date, publisher, cover_state)
    label = Label.new(title, color)
    @books.push(book)
    @labels.push(label)
    puts 'You\'ve successfully added a book'
  end

  def list_all_books
    puts 'Books unavailable' if @books.empty?
    puts
    @books.each do |book|
      puts "Publish Date: #{book.publish_date}, Publisher: #{book.publisher}, Cover State: #{book.cover_state}"
    end
  end

  def list_all_labels
    puts 'Labels unavailable' if @labels.empty?
    puts
    @labels.each do |label|
      puts "Title: #{label.title}, Author: #{label.color}"
    end
  end
end
