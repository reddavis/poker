class Card
  
  attr_reader :value, :suit
  
  VALUES = {
      'T' => 10,
      'J' => 11,
      'Q' => 12,
      'K' => 13,
      'A' => 14
    }

    SUITS = {
      'C' => :clubs,
      'D' => :diamonds,
      'H' => :hearts,
      'S' => :spades
    }
  
  def initialize(string)
    value = string[0, 1]
    @value = VALUES[value] || value.to_i
    @suit = SUITS[string[1,1]]
  end
  
end