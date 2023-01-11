require_relative '../classes/source'
require_relative '../classes/item'
describe Source do
  describe '#new' do
    before :each do
      @source = Source.new('Online')
    end
    it 'should take two arguments and create a Source object' do
      expect(@source).to be_an_instance_of Source
    end
    describe '#add_item' do
      it 'should return a non-empty items array' do
        item = Item.new('2022-04-21')
        @source.add_item(item)
        expect(@source.items.empty?).to be false
      end
    end
  end
end
