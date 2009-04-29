require 'helper'

class TestThreeOfAKind < Test::Unit::TestCase
  
  def test_hand_is_a_three_of_a_kind
    prepare_deck(THREE_OF_A_KIND).each do |cards|
      assert ThreeOfAKind.valid?(cards)
    end
  end
 
  def test_hand_is_not_a_three_of_a_kind
    prepare_deck('3D 3S 5H 2C 4C').each do |cards|
      assert !ThreeOfAKind.valid?(cards)
    end
  end
  
  # 0,1,[2],[3],[4]
  def test_one_three_of_a_kind_beats_another
    a_cards = prepare_cards('5H 5C 5D 3H 2H')
    b_cards = prepare_cards('2D 2C 2H 5D 6D')
    a = ThreeOfAKind.new(a_cards)
    b = ThreeOfAKind.new(b_cards)
    assert a.beats(b)
  end
  
  # 0,[1],[2],[3],4
  def test_one_three_of_a_kind_beats_another_two
    a_cards = prepare_cards('5H 5C 5D 6H 2H')
    b_cards = prepare_cards('3D 3C 3H 2D 6D')
    a = ThreeOfAKind.new(a_cards)
    b = ThreeOfAKind.new(b_cards)
    assert a.beats(b)
  end
  
end