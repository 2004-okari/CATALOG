# frozen_string_literal: true

require_relative '../classes/book'

# This for the list
class List
  def list_all_books(books)
    puts 'Books unavailable' if books.empty?
    puts
    books.each do |book|
      puts "Publish Date: #{book.publish_date}, Publisher: #{book.publisher}, Cover State: #{book.cover_state}"
    end
  end

  def list_all_labels(labels)
    puts 'Labels unavailable' if labels.empty?
    puts
    labels.each do |label|
      puts "Title: #{label.title}, Author: #{label.color}"
    end
  end
end
