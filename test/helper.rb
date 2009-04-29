require 'rubygems'
require 'test/unit'
require 'cards'

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'poker'

class Test::Unit::TestCase
  def prepare_deck(*ary)
    deck = []
    ary.each {|cards| deck << prepare_cards(cards)}
    deck
  end
  
  def prepare_cards(cards)
    hand = cards.split(' ')
    hand = hand[0..4].map{|cards| Card.new(cards)}
    hand
  end
end
