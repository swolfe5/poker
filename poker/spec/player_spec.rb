require 'player.rb'
require 'rspec'

describe Player do
  subject(:test_player) { Player.new }

  it 'has a hand' do
    expect(test_player.hand).not_to eq(nil)
  end
  it 'has a starting pot of $5000' do
    expect(test_player.pot).to eq(5000)
  end
end
