class Straight < BasicHand
  
  def initialize(cards)
    @hand_type_score = 5
    @name = 'Straight'
    super
  end
  
  def self.valid?(hand)
    answer = true
    hand.sort! {|a,b| a.value <=> b.value}
    
    hand.each_with_index do |card, index|
      break if index == 4
      if card.value+1 != hand[index+1].value
        answer = false
        break
      end
    end
    
    answer
  end
    
end