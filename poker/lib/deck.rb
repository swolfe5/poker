# require_relative 'card'

class Deck
  attr_accessor :deck

  SUITS = [
    :spade,
    :heart,
    :club,
    :diamond
  ]

  CARDS = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]

  def initialize
    @deck = []
    populate
  end

  def populate
    SUITS.each do |suit|
      CARDS.each do |value|
        deck << Card.new(value, suit)
      end
    end
  end

end
