require 'helper'

class TestPoker < Test::Unit::TestCase
      
  def test_should_have_two_hands
    hands_amount = Poker.new("#{HIGH_CARD} #{HIGH_CARD}").hands.size
    assert_equal(hands_amount, 2)
  end
  
  def test_hands_are_a_four_of_a_kind_and_a_high_card
    a = Poker.new("#{FOUR_OF_A_KIND} #{HIGH_CARD}").hands
    assert_kind_of(FourOfAKind, a[0])
    assert_kind_of(HighCard, a[1])
  end
  
  def test_hands_are_straight_flush_and_three_of_a_kind
    a = Poker.new("#{STRAIGHT_FLUSH} #{THREE_OF_A_KIND}").hands
    assert_kind_of(StraightFlush, a[0])
    assert_kind_of(ThreeOfAKind, a[1])
  end
  
  # Test who wins
  
  def test_that_black_wins
    a = Poker.new("#{STRAIGHT_FLUSH} #{THREE_OF_A_KIND}")
    assert_equal(a.who_wins?, 'Black wins')
  end
  
  def test_that_white_wins
    a = Poker.new("#{THREE_OF_A_KIND} #{STRAIGHT_FLUSH}")
    assert_equal(a.who_wins?, 'White wins')
  end
  
  def test_a_tie
    a = Poker.new("#{PAIR} #{PAIR}")
    assert_equal(a.who_wins?, 'Tie')
  end
  
end
