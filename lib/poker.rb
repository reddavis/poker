require 'card'
Dir['hand_types/*.rb'].each {|path| require path}

class Poker
    
  def initialize(hand)
    hand = hand.split(' ')
    hands << hand[0..4].map{|cards| Card.new(cards)}
    hands << hand[5..9].map{|cards| Card.new(cards)}
    define_hand_types
  end
  
  def hands
    @hands ||= []
  end
  
  def who_wins?
    if hands[0].beats(hands[1])
      answer = 'Black wins'
    elsif hands[1].beats(hands[0])
      answer = 'White wins'
    else
      answer = 'Tie'
    end
    answer
  end
  
  private
  
  # It goes through the hand types from strongest to weakest
  # and signs that to hands[index]
  def define_hand_types
    hands.each_with_index do |hand, index|
      if StraightFlush.valid?(hand)
        hands[index] = StraightFlush.new(hand)
      elsif FourOfAKind.valid?(hand)
        hands[index] = FourOfAKind.new(hand)
      elsif FullHouse.valid?(hand)
        hands[index] = FullHouse.new(hand)
      elsif Flush.valid?(hand)
        hands[index] = Flush.new(hand)
      elsif Straight.valid?(hand)
        hands[index] = Straight.new(hand)
      elsif ThreeOfAKind.valid?(hand)
        hands[index] = ThreeOfAKind.new(hand)
      elsif TwoPair.valid?(hand)
        hands[index] = TwoPair.new(hand)
      elsif Pair.valid?(hand)
        hands[index] = Pair.new(hand)
      else
        hands[index] = HighCard.new(hand)
      end
    end  
  end
    
end