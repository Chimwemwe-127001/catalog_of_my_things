require_relative '../item'
require_relative '../classes/author'

describe Author do
  before :each do
    @author = Author.new("Jeff", "Rowling")
  end

  it 'should detect the first name of the author' do
    expect(@author.first_name).to eq 'Jeff'
  end

  it 'should detect the second name of the author' do
    expect(@author.last_name).to eq 'Rowling'
  end

  it 'should detect the author id' do
    author = Author.new("Chinua", "Achebe")
    allow(author).to receive(:id) { 1 }
    expect(author.id).to eq 1
  end

  it 'should detect the author items' do
    item = Item.new(2010)
    @author.add_item(item)
    expect(@author.items.include?(item)).to eq true
  end
end