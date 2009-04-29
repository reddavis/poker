require 'helper'

class TestPair < Test::Unit::TestCase
  
  def test_hand_is_a_pair
    prepare_deck(PAIR).each do |cards|
      assert Pair.valid?(cards)
    end
  end
 
  def test_hand_is_not_a_pair
    prepare_deck('7D 3S 4H 2C 8C').each do |cards|
      assert !Pair.valid?(cards)
    end
  end
  
  def test_one_pair_beats_another
    a_cards = prepare_cards('7H 7C 8D 5H 3H')
    b_cards = prepare_cards('4D 4C 2H 5D TD')
    a = Pair.new(a_cards)
    b = Pair.new(b_cards)
    assert a.beats(b)
  end
  
  # If both pairs are the same, the winner is the person with
  # the highest high card
  def test_one_pair_beats_another_with_the_same_pair
    a_cards = prepare_cards('7H 7C 8D 5H 3H')
    b_cards = prepare_cards('7D 7S 2H 5D 8D')
    a = Pair.new(a_cards)
    b = Pair.new(b_cards)
    assert a.beats(b)
  end
  
end