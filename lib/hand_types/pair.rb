class Pair < BasicHand
  
  def initialize(cards)
    @hand_type_score = 3
    @name = 'Pair'
    super
  end
  
  def hand_score
    card_values = cards.map {|a| a.value}.sort {|a,b| a <=> b}.reverse
    
    card_values.each_with_index do |value, index|
      if value = card_values[index+1]
        @hand_score = value
        break
      end
    end

    card_values.delete(@hand_score)
    @next_highest_value = card_values
    
    @hand_score
  end
  
  def self.valid?(hand)
    answer = false
    
    # Call unique and check if size has changed
    answer = true if (hand.size <=> hand.map {|a| a.value}.uniq.size) != 0
    
    answer
  end
    
end