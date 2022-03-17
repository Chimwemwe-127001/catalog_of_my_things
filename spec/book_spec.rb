require 'date'
require_relative '../classes/book'

describe Book do
  before :each do
    @book = Book.new(title: 'Title', publisher: 'Publisher', cover_state: 'good', publish_date: Date.parse('2022/2/8'))
  end

  it 'should detect the book title' do
    expect(@book.title).to eq 'Title'
  end

  it 'should detect the book publisher' do
    expect(@book.publisher).to eq 'Publisher'
  end

  it 'should detect the book cover_state' do
    expect(@book.cover_state).to eq 'good'
  end

  it 'should detect the book publish_date' do
    expect(@book.publish_date).to eq Date.parse('2022/2/8')
  end
end
