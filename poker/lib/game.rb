require_relative 'player'
require_relative 'deck'
require_relative 'card'

class Game
  attr_accessor :players, :total_pot, :active_players, :current_player, :deck

  def initialize(players)
    @players = players
    @total_pot = 0
    @active_players = []
    @current_player = nil
    @deck = Deck.new.deck
  end

  def round_over?
    active_players.length == 1
  end

  def retrieve_cards
    deck += active_players.firstRai.hand
    active_players.first.hand = []
  end


  def start_round
    @active_players = players
    @current_player = active_players.first
    deck.shuffle!
    deal
  end

  def find_winner(active_players)
    high_score = 0
    winner = nil

    active_players.each do |player|
      value = 0
      player.hand.each { |card| value += card.value }
      if value > high_score
        high_score = value
        winner = player
      end
    end
    winner
  end

  def render_hand
    @current_player.hand.each do |card|
      print " #{card.value}"
    end
  end

  def gameplay
    start_round
    until round_over?
      take_turn(current_player)
    end
    winner = find_winner
    puts "#{winner.name} is the winner!"
    retrieve_cards
  end

  def take_turn(current_player)
    render_hand
    move = current_player.action
    case move
    when 'fold'
      puts "You loser"
      deck += current_player.hand
      active_players.delete(current_player)
    when 'raise'
      puts "How much do you want to raise?"
      amt = gets.chomp
      current_player.raise(amt)
    when 'see'
      puts "Ok"
    end
    active_players.rotate! unless move == 'fold'
    current_player = active_players.first
  end

  def deal
    active_players.each do |player|
      5.times { player.hand << deck.shift}
    end
  end

  private

  def pot_reset
    toal_pot = 0
  end
end
