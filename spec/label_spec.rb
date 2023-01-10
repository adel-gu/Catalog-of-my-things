require_relative '../classes/label'

describe Label do
  before :each do
    @label = Label.new('In the chest of a woman', 'Violet')
  end

  describe '#new' do
    it 'should take two arguments and create a Label object' do
      expect(@label).to be_an_instance_of Label
    end
  end
end