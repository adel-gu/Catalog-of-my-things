require_relative '../classes/genre'
require_relative '../classes/item'

describe Genre do
  before(:each) do
    @item = Item.new('2023-01-10')
  end

  context 'When testing the Genre class' do
    it 'should add an item to the genre items when we call the add_items method' do
      genre = Genre.new('Comedy')
      expect(genre.items.length).to eq 0
      genre.add_item(@item)
      expect(genre.items.length).to eq 1
    end
  end
end
