require_relative '../classes/source'
require_relative '../classes/item'

describe Source do
  before :each do
    @source = Source.new('Online')
  end

  describe '#new' do
    it 'should take two arguments and create a Source object' do
      expect(@source).to be_an_instance_of Source
    end
  end

  describe '#add_item' do
    it 'should return a non-empty items array' do
      item = Item.new('2022-04-21')
      @source.items << item
      expect(@source.items.empty?).to be false
    end
  end
end
