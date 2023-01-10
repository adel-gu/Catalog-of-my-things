require_relative '../classes/movie'

movie = Movie.new('2020/2/2')

describe '#Review the Movie file' do
  it 'returns true' do
    expect(movie.silent).to eql true
  end

  it 'returns true' do
    expect(movie.can_be_archived?).to eql true
  end
end
