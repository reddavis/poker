require 'helper'

class TestFlush < Test::Unit::TestCase
  
  def test_hand_is_a_flush
    prepare_deck(FLUSH, 'TD JD 3D KD AD').each do |cards|
      assert Flush.valid?(cards)
    end
  end
 
  def test_hand_is_not_flush
    prepare_deck('TD JD 3D KS AD').each do |cards|
      assert !Flush.valid?(cards)
    end
  end
  
  def test_one_flush_beats_another
    a_cards = prepare_cards('5H 6H 7H 8H 9H')
    b_cards = prepare_cards('2D 3D 4D 5D 6D')
    a = Flush.new(a_cards)
    b = Flush.new(b_cards)
    assert a.beats(b)
  end
 
end