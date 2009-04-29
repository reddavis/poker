require 'helper'

class TestCard < Test::Unit::TestCase
  
  def test_card_value
    assert_equal(Card.new('4C').value, 4)
  end
  
  def test_card_suit
    assert_equal(Card.new('4C').suit, :clubs)
  end
  
end