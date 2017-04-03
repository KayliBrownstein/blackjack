require_relative 'deck'
require 'pry'

class Hand
  attr_reader :cards, :score
  def initialize(cards)
    @cards = cards
    @score = 0
  end

  def add(new_card)
    @cards.insert(-1, new_card[0])
  end

  def calculate_hand
    @score = 0
    @cards.each do |card|
      if ["J", "Q", "K"].include?(card.rank)
        @score += 10
      elsif ["A"].include?(card.rank)
        if @score <= 10
          @score += 11
        else
          @score += 1
        end
      else
        @score += card.rank
      end
    end
    @score
  end

end
