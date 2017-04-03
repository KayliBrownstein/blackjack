require "spec_helper"

RSpec.describe Card do
  let!(:card) { Card.new('5', '♥') }
  let!(:ace) { Card.new('A', '♥') }
  let!(:jack) { Card.new('J', '♥') }

  describe "initialize" do
    it 'has a rank' do
      expect(card.rank).to eq('5')
    end

    it 'has a suit' do
      expect(card.suit).to eq('♥')
    end
  end

  describe '#ace?' do
    it 'returns true of the card is an ace' do
      expect(ace.ace?).to eq(true)
    end

    it 'returns false if the card is not an ace' do
      expect(card.ace?).to eq(false)
    end
  end

  describe '#face_card' do
    it 'returns true if the card is a face card' do
      expect(jack.face_card?).to eq(true)
    end

    it 'returns false if the card is not a face card' do
      expect(card.face_card?).to eq(false)
    end

  end

  describe '#number_card?' do
    it 'returns true if the card is a number card' do
      expect(card.number_card?).to eq(true)
    end

    it 'returns false if the card is not a number card' do
      expect(ace.number_card?).to eq(false)
    end
  end
end
