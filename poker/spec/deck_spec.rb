require 'deck'
require 'rspec'

describe Deck do
  subject(:test_deck) {Deck.new}

  it 'initializes with a deck of 52 cards' do
    expect(test_deck.deck.length).to eq(52)
  end

  it 'contains 52 instances of Card' do
    expect(test_deck.deck.all? {|card| card.is_a?(Card)}).to be(true)
  end

  it 'can be shuffled' do
    current_deck = test_deck.deck.dup
    test_deck.deck.shuffle!
    expect(test_deck.deck).not_to eq(current_deck)
  end
end
