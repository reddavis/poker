class TwoPair < BasicHand
  
  def initialize(cards)
    @hand_type_score = 3
    @name = 'Two Pair'
    super
  end
  
  def hand_score
    # Highest pair will go to the front on the array
    card_values = cards.map {|a| a.value}.sort {|a,b| a <=> b}.reverse
    
    @hand_score = []

    card_values.each_with_index do |value, index|
      if value == card_values[index+1]
        @hand_score << value
      end
    end
    
    card_values.delete(@hand_score)
    @next_highest_value = card_values
    
    @hand_score
  end
  
  def self.valid?(hand)
    answer = false
    
    pairs = hand.map {|a| a.value}.uniq.size    
    
    answer = true if pairs <= 3
    answer
  end
    
end