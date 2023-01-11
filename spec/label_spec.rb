require_relative '../classes/label'
require_relative '../classes/item'

describe Label do
  before :each do
    @label = Label.new('In the chest of a woman', 'Violet')
  end

  describe '#new' do
    it 'should take two arguments and create a Label object' do
      expect(@label).to be_an_instance_of Label
    end
  end

  describe '#add_item' do
    it 'should return a non-empty items array' do
      item = Item.new('2022-04-21')
      @label.items << item
      expect(@label.items.empty?).to be false
    end
  end
end
