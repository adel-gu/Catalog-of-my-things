require_relative '../classes/item'
require_relative '../classes/book'

describe Book do
  before :each do
    @book = Book.new('2015-04-21', 'Ebo White', 'bad')
  end

  describe '#new' do
    it 'should return an instance of Book' do
      expect(@book).to be_an_instance_of Book
    end
  end

  describe '< Item' do
    it 'should inherit from Item class' do
      expect(Book).to be < Item
    end
  end

  describe '#move_to_archive' do
    it 'should return true' do
      @book.move_to_archive
      expect(@book.archived).to be true
    end
  end
end
