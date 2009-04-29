class Flush < BasicHand
  
  def initialize(cards)
    @hand_type_score = 6
    @name = 'Flush'
    super
  end
  
  def self.valid?(hand)
    answer = false
        
    if hand.map {|a| a.suit}.uniq.size == 1
      answer = true
    end
    
    answer
  end
    
end