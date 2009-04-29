class ThreeOfAKind < BasicHand
  
  def initialize(cards)
    @hand_type_score = 4
    @name = 'Three Of A Kind'
    super
  end
  
  def hand_score
    card_values = cards.sort {|a,b| a.value <=> b.value}.map {|a| a.value}
    
    # Only possible positions
    # [0],[1],[2],3,4
    # 0,[1],[2],[3],4
    # 0,1,[2],[3],[4]
    if card_values[0] == card_values[2]
      @hand_score = card_values[2]
    elsif card_values[1] == card_values[3]
      @hand_score = card_values[3]
    else
      @hand_score = card_values.last
    end
    
    @hand_score
  end
  
  def self.valid?(hand)
    answer = false
    hand.sort! {|a,b| a.value <=> b.value}
    
    # Possible three of a kinds
    three_of_a_kind_one = hand[0..2].map {|a| a.value}.uniq.size
    three_of_a_kind_two = hand[1..3].map {|a| a.value}.uniq.size
    three_of_a_kind_three = hand[2..4].map {|a| a.value}.uniq.size
    
    if [three_of_a_kind_one, three_of_a_kind_two, three_of_a_kind_three].include?(1)
      answer = true
    end
    
    answer
  end
    
end