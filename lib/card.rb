class Card

  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def face_card?
    'JQK'.include?(@rank)
  end

  def ace?
    @rank == 'A'
  end

  def number_card?
    @rank.to_i != 0
  end

end
