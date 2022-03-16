require_relative '../classes/lable'
require_relative '../classes/book'

describe Label do
  before :each do
    @label = Label.new(title: 'Title', color: 'Red')
  end

  it 'should detect the label title' do
    expect(@label.title).to eq 'Title'
  end

  it 'should detect the label color' do
    expect(@label.color).to eq 'Red'
  end

  it 'should detect the label items' do
    book = Book.new(title: 'Title', publisher: 'Publisher', cover_state: 'good', publish_date: Date.parse('2022/2/8'))
    @label.add_item(book)
    expect(@label.items.include?(book)).to eq true
  end
end
