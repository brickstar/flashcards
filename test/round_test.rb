require "minitest/autorun"
require "minitest/pride"
require "./lib/guess.rb"
require "./lib/card.rb"
require "./lib/deck.rb"
require "./lib/round.rb"
require "pry"

class RoundTest < Minitest::Test

  def setup
    @card_1 = Card.new("Alaska?", "Juneau")
    @card_2 = Card.new("The Viking spacecraft?", "Mars")
    @deck   = Deck.new([@card_1, @card_2]) #attributes of Deck
    @round  = Round.new(@deck)
  end

  def test_round_exists
    assert_instance_of Round, @round
  end

  def test_round_has_a_deck
    assert_instance_of Deck, @round.deck
  end

  def test_round_guess_starts_empty
    assert_equal [], @round.guesses
  end

  def test_round_has_a_current_card
    assert_instance_of Card, @round.current_card
  end

  def test_round_records_guesses
    result = @round.record_guess("Juneau")

    assert_instance_of Guess, result
  end

  def test_round_counts_guesses

    assert @round.guesses.empty?
    result = @round.record_guess("Juneau")
    assert_equal @round.guesses.count, 1
  end

  # def test_round_has_feedback   redundant
  #
  # end
  def test_correct_number_user_answer_1
    assert_equal @round.number_correct, 0
    result = @round.record_guess("Juneau")
    assert_equal @round.number_correct, 1
  end
end

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
