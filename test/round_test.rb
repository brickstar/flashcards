require "minitest/autorun"
require "minitest/pride"
require "./lib/guess.rb"
require "./lib/card.rb"
require "./lib/deck.rb"
require "./lib/round.rb"
require "pry"

class RoundTest < Minitest::Test

  def test_round_exists
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars")
    deck   = Deck.new([card_1, card_2]) #attributes of Deck
    round  = Round.new(deck
    )
    assert_instance_of Round, round
  end

  def test_round_has_a_deck
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars")
    deck   = Deck.new([card_1, card_2]) #attributes of Deck
    round  = Round.new(deck)

    assert_instance_of Deck, round.deck
  end

  def test_round_guess_starts_empty
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars")
    deck   = Deck.new([card_1, card_2]) #attributes of Deck
    round  = Round.new(deck)

    assert_equal [], round.guesses
  end

  def test_round_has_a_current_card
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars")
    deck   = Deck.new([card_1, card_2]) #attributes of Deck
    round  = Round.new(deck)

    assert_instance_of Card, round.current_card
  end

  def test_round_records_guesses
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars")
    deck   = Deck.new([card_1, card_2]) #attributes of Deck
    round  = Round.new(deck)
    result = round.record_guess("Juneau")

    assert_instance_of Guess, result
  end


end

# card_1 = Card.new("What is the capital of Alaska?", "Juneau")
# card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
# deck = Deck.new([card_1, card_2])
# round = Round.new(deck)
# round.deck
# => #<Deck:0x007ffdf181b9c8 @cards=[...]>
# round.guesses
# => []
# round.current_card
# => #<Card:0x007ffdf1820a90 @answer="Juneau", @question="What is the capital of Alaska?">
# round.record_guess("Juneau")
# => #<Guess:0x007ffdf19c8a00 @card=#<Card:0x007ffdf1820a90 @answer="Juneau", @question="What is the capital of Alaska?">, @response="Juneau">
# round.guesses.count
# => 1
# round.guesses.first.feedback
# => "Correct!"
# round.number_correct
# => 1
# round.current_card
# => #<Card:0x007ffdf1820a90 @answer="93,000,000", @question="Approximately how many miles are in one astronomical unit?">
# round.record_guess("2")
# => #<Guess:0x007ffdf19c8a00 @card=#<Card:0x007ffdf1820a90 @answer="93,000,000", @question="Approximately how many miles are in one astronomical unit?">, @response="2">
# round.guesses.count
# => 2
# round.guesses.last.feedback
# => "Incorrect."
# round.number_correct
# => 1
# round.percent_correct
# => 50
