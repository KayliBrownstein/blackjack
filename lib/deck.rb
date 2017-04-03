require_relative 'card'
require 'pry'

class Deck
  SUITS = ['♦', '♣', '♠', '♥']
  RANKS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']

  attr_accessor :cards

  def initialize
    @cards = build_deck
  end

  def build_deck
    @collection = []
    SUITS.each do |suit|
      RANKS.each do |rank|
        @collection << Card.new(rank, suit)
      end
    end
    @collection.shuffle!
  end

  def deal(num)
    @collection.pop(num)
  end

  def collection
    @collection
  end

end
