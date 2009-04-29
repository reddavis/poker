# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{poker}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Red Davis"]
  s.date = %q{2009-04-30}
  s.description = %q{A gem to solve this problem - http://acm.uva.es/p/v103/10315.html}
  s.email = %q{reddavis@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
    "README.textile"
  ]
  s.files = [
    "LICENSE",
    "README.textile",
    "Rakefile",
    "VERSION.yml",
    "lib/card.rb",
    "lib/hand_types/basic_hand.rb",
    "lib/hand_types/flush.rb",
    "lib/hand_types/four_of_a_kind.rb",
    "lib/hand_types/full_house.rb",
    "lib/hand_types/high_card.rb",
    "lib/hand_types/pair.rb",
    "lib/hand_types/straight.rb",
    "lib/hand_types/straight_flush.rb",
    "lib/hand_types/three_of_a_kind.rb",
    "lib/hand_types/two_pair.rb",
    "lib/poker.rb",
    "test/cards.rb",
    "test/helper.rb",
    "test/test_card.rb",
    "test/test_flush.rb",
    "test/test_four_of_a_kind.rb",
    "test/test_full_house.rb",
    "test/test_high_card.rb",
    "test/test_pair.rb",
    "test/test_poker.rb",
    "test/test_straight.rb",
    "test/test_straight_flush.rb",
    "test/test_three_of_a_kind.rb",
    "test/test_two_pair.rb"
  ]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/reddavis/Poker}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{A gem to solve this problem - http://acm.uva.es/p/v103/10315.html}
  s.test_files = [
    "test/cards.rb",
    "test/helper.rb",
    "test/test_card.rb",
    "test/test_flush.rb",
    "test/test_four_of_a_kind.rb",
    "test/test_full_house.rb",
    "test/test_high_card.rb",
    "test/test_pair.rb",
    "test/test_poker.rb",
    "test/test_straight.rb",
    "test/test_straight_flush.rb",
    "test/test_three_of_a_kind.rb",
    "test/test_two_pair.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
