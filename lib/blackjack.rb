require_relative "card"
require_relative "deck"
require_relative "hand"

class Blackjack
  def initialize
    @deck = Deck.new
    @player_hand = Hand.new(@deck.deal(2))
    @dealer_hand = Hand.new(@deck.deal(2))
    start
  end

  def start
    puts "Welcome to Blackjack!\n\n"
    player_turn
  end

  def deal_to(user)
    if user == 'player'
      @player_hand.add(@deck.deal(1))
      puts "Player was dealt #{@player_hand.cards[2].rank}#{@player_hand.cards[2].suit}"
      puts "Player score: #{@player_hand.calculate_hand}"
      hit_or_stay
    elsif user == 'dealer'
      @dealer_hand.add(@deck.deal(1))
      puts "Dealer was dealt #{@dealer_hand.cards[2].rank}#{@dealer_hand.cards[2].suit}"
      puts "Dealer score: #{@dealer_hand.calculate_hand}\n\n"
      output
    end
  end

  def player_turn
    puts "Player was dealt #{@player_hand.cards[0].rank}#{@player_hand.cards[0].suit}"
    puts "Player was dealt #{@player_hand.cards[1].rank}#{@player_hand.cards[1].suit}"
    puts "Player score: #{@player_hand.calculate_hand}"
    hit_or_stay
  end

  def hit_or_stay
    puts "Hit or stay (H/S):"
    choice = STDIN.gets.chomp.downcase
    if valid_input?(choice)
      if choice == 'h'
        deal_to('player')
      elsif choice == 's'
        puts "Player score: #{@player_hand.score}\n\n"
        dealer_turn
      end
    end
  end

  def valid_input?(choice)
    if choice != 's' && choice != 'h'
      false
      puts "Input not valid. Try again."
      hit_or_stay
    else
      true
    end
  end

  def dealer_turn
    puts "Dealer was dealt #{@dealer_hand.cards[0].rank}#{@dealer_hand.cards[0].suit}"
    puts "Dealer was dealt #{@dealer_hand.cards[1].rank}#{@dealer_hand.cards[1].suit}"
    puts "Dealer score: #{@dealer_hand.calculate_hand}"
    if @dealer_hand.score <= 16
      puts "Dealer hits."
      deal_to('dealer')
    else
      output
    end
  end

  def output
    if @player_hand.score > @dealer_hand.score && @player_hand.score <= 21
      puts "Player wins!"
    elsif @dealer_hand.score > @player_hand.score && @dealer_hand.score <= 21
      puts "Dealer wins!"
    elsif @dealer_hand.score > 21 && @player_hand.score <= 21
      puts "Player wins!"
    elsif @player_hand.score > 21 && @dealer_hand.score <= 21
      puts "Dealer wins!"
    elsif @player_hand.score == @dealer_hand.score
      puts "Push! It's a tie."
    end
  end

end

Blackjack.new
