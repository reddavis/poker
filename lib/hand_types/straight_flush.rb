class StraightFlush < BasicHand
  
  def initialize(cards)
    @name = 'Straight Flush'
    @hand_type_score = 8
    super
  end
  
  def hand_score
    cards.sort {|a,b| a.value <=> b.value}.last.value
  end
  
  def self.valid?(hand)
    answer = true
    hand.sort! {|a,b| a.value <=> b.value}
    suit = hand[0].suit
    start_value = hand[0].value
    hand.each_with_index do |card, index|
      if card.suit != suit || card.value != (start_value + index)
        answer = false
        break
      end
    end
    answer
  end
    
end