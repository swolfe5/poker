class Player
  attr_accessor :name, :hand, :pot, :active

  def initialize(name)
    @name = name
    @hand = []
    @pot = 5000
  end

  def discard_cards
    cards_to_drop = get_input
    if valid_entry?(cards_to_drop)
      keep = []
      hand.each_with_index do |card, idx|
        keep << card unless cards_to_drop.include?(idx)
      end
      hand = keep
    end
  end

  def valid_entry?(cards)
    raise "Too many cards!" unless cards.length <= 3
    unless cards.all? { |card| card.between?(0,4)}
      raise "Only choose numbers 1-5"
    end
    true
  end

  def action
    puts '#{name}, Please Fold, See or Raise'
    gets.chomp
  end

  def raise(amount)
    @pot -= amount.to_i
  end


  private

  def get_input
    puts "Which cards are you discarding?"
    gets.chomp.delete(" ").split(",").map { |num| num - 1}
  end
end
