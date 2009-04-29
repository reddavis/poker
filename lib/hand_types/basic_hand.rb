class BasicHand
  attr_reader :name, :cards, :hand_type_score, :next_highest_value
  
  def initialize(cards)
    @cards = cards
  end
  
  # Basic high cards hand score, also used for scoring a flush
  def hand_score
    cards.map {|a| a.value}.sort {|a,b| a <=> b}.last
  end
  
  def beats(other_hand)
    answer = false
    
    unless self.class == other_hand.class
      if self.hand_type_score > other_hand.hand_type_score
        answer = true
      end
    else
      hand_score_difference = self.hand_score <=> other_hand.hand_score
      if hand_score_difference == 1
        answer = true
        
      # Sometimes there can be a "hand draw". An example of this is if both hands
      # Have a pair with the same values. We then use the rest of the cards to 
      # Determine who has the "high card"
      
      elsif hand_score_difference == 0
        difference = self.next_highest_value <=> other_hand.next_highest_value
        case difference
          when 0 || -1
            answer = false
          else
            answer = true
        end
      end
    end
    
    answer
  end
  
end