# frozen_string_literal: true

# This is book-label.rb it reps an item class
module BookLabel
  def add_book
    publish_date = get_user_input('Enter the date of publication (yyyy-mm-dd):')
    publisher = get_user_input('Enter the publisher\'s name:')
    cover_state = user_cover_state
    title = get_user_input('Enter the label title:')
    color = get_user_input('Enter the color of the book')

    book = create_book(publish_date, publisher, cover_state)
    label = create_label(title, color)

    @books.push(book)
    @labels.push(label)

    puts 'You\'ve successfully added a book'
  end

  def get_user_input(prompt)
    puts prompt
    gets.chomp
  end

  def user_cover_state
    loop do
      puts 'Enter the state of the book cover (Good or bad):'
      cover_state = gets.chomp.downcase
      return cover_state if %w[good bad].include?(cover_state)

      puts 'Invalid input. Please enter "Good" or "Bad".'
    end
  end

  def create_book(publish_date, publisher, cover_state)
    Book.new(publish_date, publisher, cover_state)
  end

  def create_label(title, color)
    Label.new(title, color)
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
