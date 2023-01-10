require_relative '../classes/game'

# describe Game do
#   before(:each) do
#    @game = Game.new('2023-01-01', '2020-01-01', true)
#    @game = Game.new('2020-01-01', '2018-01-01', true)

#    context 'test multple player' do
#     it ' should return true or false'
#       expect(@game.multiple_player).to eq true
#    end
# end

describe Game do
  before(:each) do
    @game = Game.new('2023-01-01', '2020-01-01', multiplayer: true)
  end

  context 'create game' do
    it 'check multiplayer' do
      expect(@game.multiplayer).to eq true
    end

    it 'check when last played' do
      expect(@game.last_played_at).to eq '2023-01-01'
    end

    it 'check if it can be archived' do
      @game.can_be_archived?
      expect(@game.can_be_archived?).to eq false
    end
  end
end
