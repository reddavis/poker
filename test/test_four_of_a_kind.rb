require 'helper'

class TestFourOfAKind < Test::Unit::TestCase
  
  def test_hand_is_a_four_of_a_kind
    prepare_deck(FOUR_OF_A_KIND, 'TD TH TS AD TC').each do |cards|
      assert FourOfAKind.valid?(cards)
    end    
  end
  
  def test_hand_is_not_straight_flush
    prepare_deck(TRICK_FOUR_OF_A_KIND, 'TD 9H TS AD TC').each do |cards|
      assert !FourOfAKind.valid?(cards)
    end
  end
  
  def test_one_four_of_a_kind_beats_another
    a_cards = prepare_cards('5D 5S 5C 5H 7H')
    b_cards = prepare_cards('3D 3S 3C 3H 7H')
    a = FourOfAKind.new(a_cards)
    b = FourOfAKind.new(b_cards)
    assert a.beats(b)
  end
  
end