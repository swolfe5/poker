require 'card'
require 'rspec'

describe Card do
  subject(:sample_card) { Card.new(:ace, :club) }

  describe '#initialize' do
    it 'initialize with value' do
      expect(sample_card.value).to eq(:ace)
    end
    it 'initialize with suit' do
      expect(sample_card.suit).to eq(:club)
    end
  end
end
