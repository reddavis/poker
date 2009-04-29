require 'helper'

class TestFullHouse < Test::Unit::TestCase
  
  def test_hand_is_a_full_house
    prepare_deck(FULL_HOUSE, '3D 3H 8H 8D 8S').each do |cards|
      assert FullHouse.valid?(cards)
    end
  end
  
  def test_hand_is_not_full_house
    prepare_deck(THREE_OF_A_KIND).each do |cards|
      assert !FullHouse.valid?(cards)
    end
  end
  
  def test_one_full_house_beats_another 
    a_cards = prepare_cards('3H 3C 7D 7S 7C')
    b_cards = prepare_cards('3D 3S 3C 5H 5C')
    a = FullHouse.new(a_cards)
    b = FullHouse.new(b_cards)
    assert a.beats(b)
  end
  
end