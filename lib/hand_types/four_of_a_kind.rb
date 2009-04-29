class FourOfAKind < BasicHand
  
  def initialize(cards)
    @name = 'Four Of A Kind'
    @hand_type_score = 7
    super
  end
  
  # We already know its a four of a kind so...
  # it can only be in two position:
  # 1,1,1,1,2 or
  # 2,3,3,3,3
  def hand_score
    card_value = cards.sort {|a,b| a.value <=> b.value}.map {|a| a.value}
    if card_value[0] == card_value[1]
      @hand_score = card_value[0]
    else
      @hand_score = card_value.last
    end
    @hand_score
  end
  
  def self.valid?(hand)
    answer = true
    hand.sort! {|a,b| a.value <=> b.value}
    hand.each_with_index do |card, index|
      # If we are past card 2 theres not enough cards to make 4 of a kind
      if index == 2 
        answer = false
        break
      end  
      v = card.value
      if v == hand[index+1].value && v == hand[index+2].value && v == hand[index+3].value
        break
      else
        answer = false
        break
      end
    end
    answer
  end
  
end