require "minitest/autorun"
require "minitest/pride"
require "./lib/guess"
require "./lib/card"
require "pry"

class GuessTest < Minitest::Test

  def setup
    @card  = Card.new("What is the capital of Alaska?", "Juneau")
    @guess = Guess.new("Juneau", @card)
  end

  def test_guess_exists
    assert_instance_of Guess, @guess
  end

  def test_guess_has_a_card
    assert_instance_of Card, @guess.card
  end

  def test_guess_has_a_response
    assert_equal "Juneau", @guess.response
  end

  def test_guess_is_correct
    assert true, @guess.correct?
  end

  def test_feedback_is_correct
    assert_equal "Correct!", @guess.feedback
  end

  def test_another_card
    card  = Card.new("blah", "Saturn")
    guess = Guess.new("Saturn", card)
    assert_instance_of Card, guess.card
    assert_equal "Saturn", guess.response
    assert guess.correct?
  end
end
