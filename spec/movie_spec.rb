require_relative '../classes/movie'

before(:each) do
  @movie = Movie.new('2020/2/2')
end

describe 'Movie Class' do
  it 'returns true' do
    expect(movie.silent).to eql false
  end

  it 'returns true' do
    expect(movie.move_to_archive?).to eql false
  end
end
