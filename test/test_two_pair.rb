require 'helper'

class TestTwoPair < Test::Unit::TestCase
  
  def test_hand_is_a_two_pair
    prepare_deck(TWO_PAIR, '4C 7D 6D 6C 4H').each do |cards|
      assert TwoPair.valid?(cards)
    end
  end
 
  def test_hand_is_not_a_two_pair
    prepare_deck('7D 3S 4H 2C 4C').each do |cards|
      assert !TwoPair.valid?(cards)
    end
  end
  
  # [0],[1],{2},{3},4
  def test_one_two_pair_beats_another
    a_cards = prepare_cards('7H 7C 8D 8H 9H')
    b_cards = prepare_cards('4D 4C 4H 5D TD')
    a = TwoPair.new(a_cards)
    b = TwoPair.new(b_cards)
    assert a.beats(b)
  end
    
  # {0},{1},[2],[3],4
  def test_one_two_pair_beats_another_two
    a_cards = prepare_cards('5H 5C 8D 8H 9D')
    b_cards = prepare_cards('4H 4C 7D 7H 9D')
    a = TwoPair.new(a_cards)
    b = TwoPair.new(b_cards)
    assert a.beats(b)
  end
  
  # 0,{1},{2},[3],[4]
  def test_one_two_pair_beats_another_three
    a_cards = prepare_cards('5H 8C 8D 9H 9D')
    b_cards = prepare_cards('4H 6C 6D 7H 7D')
    a = TwoPair.new(a_cards)
    b = TwoPair.new(b_cards)
    assert a.beats(b)
  end
  
  # If the highest pair is the same it should check the second pair
  def test_one_two_pair_beats_another_with_one_same_pair
    a_cards = prepare_cards('5H 8C 8D 9H 9D')
    b_cards = prepare_cards('4H 6C 6D 9C 9S')
    a = TwoPair.new(a_cards)
    b = TwoPair.new(b_cards)
    assert a.beats(b)
  end
  
  # If both pairs are the same, the winner is the person with
  # the highest high card
  def test_one_two_pair_beats_another_with_one_same_pair
    a_cards = prepare_cards('5H 8C 8D 9H 9D')
    b_cards = prepare_cards('4H 8H 8S 9C 9S')
    a = TwoPair.new(a_cards)
    b = TwoPair.new(b_cards)
    assert a.beats(b)
  end
  
end