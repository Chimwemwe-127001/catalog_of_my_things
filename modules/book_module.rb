require_relative '../classes/book'
require 'json'

module BooksDataController
  def load_books
    file = './json/books.json'
    data = []
    if File.exist?(file) && File.read(file) != ''
      JSON.parse(File.read(file)).each do |element|
        data.push(Book.new(title: element['title'], publisher: element['publisher'],
                           cover_state: element['cover_state'], publish_date: element['publish_date']))
      end
    end
    data
  end

  def save_books
    data = []
    @books.each do |book|
      data.push({ title: book.title, publisher: book.publisher, cover_state: book.cover_state,
                  publish_date: book.publish_date })
    end
    File.write('./json/books.json', JSON.generate(data))
  end
end
