require 'json'
require_relative 'classes/label'
require_relative 'classes/loading'
require_relative 'classes/storage'
require_relative 'classes/book'
require_relative 'classes/book_label'

# This contains general information
class App
  def initialize
    @books = []
    @labels = []
    load_data
  end

  include BookLabel

  def save_data
    puts 'saving data...'
    Storage.new.save_book(@books)
    Storage.new.save_labels(@labels)
  end

  def load_data
    Saving.new.load_books(@books)
    Saving.new.load_labels(@labels)
  end
end
