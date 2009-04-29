require 'helper'

class TestStraight < Test::Unit::TestCase
  
  def test_hand_is_a_straight
    prepare_deck(STRAIGHT).each do |cards|
      assert Straight.valid?(cards)
    end
  end
 
  def test_hand_is_not_a_straight
    prepare_deck('TD JD 3D QS KD', '2D 3H 4D 5D 7H').each do |cards|
      assert !Straight.valid?(cards)
    end
  end
  
  def test_one_straight_beats_another
    a_cards = prepare_cards('5H 6C 7H 8H 9H')
    b_cards = prepare_cards('2D 3C 4D 5D 6D')
    a = Straight.new(a_cards)
    b = Straight.new(b_cards)
    assert a.beats(b)
  end
 
end