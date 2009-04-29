require 'helper'

class TestStraightFlush < Test::Unit::TestCase
  
  def test_hand_is_a_straight_flush
    prepare_deck(STRAIGHT_FLUSH, 'TD JD QD KD AD').each do |cards|
      assert StraightFlush.valid?(cards)
    end
  end
  
  def test_hand_is_not_straight_flush
    prepare_deck(TRICK_STRAIGHT_FLUSH).each do |cards|
      assert !StraightFlush.valid?(cards)
    end
  end
  
  def test_one_straight_flush_beats_another_one
    a_cards = prepare_cards('3D 4D 5D 6D 7D')
    b_cards = prepare_cards('5D 6D 7D 8D 9D')
    a = StraightFlush.new(a_cards)
    b = StraightFlush.new(b_cards)
    assert b.beats(a)
  end
  
end