class FullHouse < BasicHand
  
  def initialize(cards)
    @hand_type_score = 7
    @name = 'full house'
    super
  end
  
  def hand_score
    card_values = cards.sort {|a,b| a.value <=> b.value}.map {|a| a.value}
    
    # Only possible positions
    # [0],[1],[2],3,4
    # 0,1,[2],[3],[4]
    if card_values[0] == card_values[2]
      @hand_score = card_values[2]
    else
      @hand_score = card_values.last
    end
    
    @hand_score
  end
  
  def self.valid?(hand)
    answer = false
    hand.sort! {|a,b| a.value <=> b.value}
    
    # Only possible ways to have 3 of a kind:
    # 3,3,3,4,5
    # 1,2,3,3,3
    # 1,2,2,2,3 <= cant have a 2 of a kind in this hand
    three_of_a_kind_one = hand[0..2].map {|a| a.value}.uniq.size
    three_of_a_kind_two = hand[2..4].map {|a| a.value}.uniq.size
    
    # Only possible to have 2 of a kind
    # 1,1,2,2,2
    # 1,1,1,2,2
    two_of_a_kind_one = hand[0..1].map {|a| a.value}.uniq.size
    two_of_a_kind_two = hand[3..4].map {|a| a.value}.uniq.size
    

    [
      [three_of_a_kind_one, two_of_a_kind_two], 
      [three_of_a_kind_two, two_of_a_kind_one]
    ].each do |group|
      if group[0] + group[1] == 2
        answer = true
        break
      end
    end
        
    answer
  end
    
end