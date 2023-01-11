require_relative '../classes/author'

describe Author do
  before(:each) do
    @author = Author.new('Stephen', 'King')
  end

  context 'create first_name' do
    it 'check for first_name' do
      expect(@author.first_name).to eq 'Stephen'
    end

    it 'check for last_name' do
      expect(@author.last_name).to eq 'King'
    end

    it 'can add_items be used' do
      @item = Item.new('2020-01-01')
      @author.add_item(@item)
      expect(@author.items).to include(@item)
    end
  end
end
