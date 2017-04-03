require "spec_helper"

RSpec.describe Hand do
  let(:hand) { Hand.new([Card.new(7, "♦"), Card.new(8, "♥")]) }

  describe "#calculate_hand" do
    it "returns sum of two non-face cards" do
      expect(hand.calculate_hand).to eq(15)
    end

    it "converts face cards to 10" do
      hand = Hand.new([Card.new("J", "♥"), Card.new("Q", "♣")])
      expect(hand.calculate_hand).to eq(20)
      hand = Hand.new([Card.new("K", "♦"), Card.new("J", "♣")])
      expect(hand.calculate_hand).to eq(20)
    end

    it "returns sum of face card and non-face card" do
      hand = Hand.new([Card.new("J", "♦"), Card.new(10, "♣")])
      expect(hand.calculate_hand).to eq(20)
      hand = Hand.new([Card.new("K", "♥"), Card.new(4, "♦")])
      expect(hand.calculate_hand).to eq(14)
    end

    it "converts ace to 11 if sum is <= 10" do
      hand = Hand.new([Card.new("A", "♣"), Card.new(6, "♥")])
      expect(hand.calculate_hand).to eq(17)
    end

    it "converts ace to 1 if first card is an ace" do
      hand = Hand.new([Card.new("A", "♦"), Card.new("A", "♣")])
      expect(hand.calculate_hand).to eq(12)
    end
  end
end
