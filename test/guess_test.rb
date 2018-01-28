require "minitest/autorun"
require "minitest/pride"
require "./lib/guess"
require "./lib/card"
require "pry"

class GuessTest < Minitest::Test

  def test_guess_exists
    card  = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)

    assert_instance_of Guess, guess
  end

  def test_guess_has_a_card
    card  = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)

    assert_instance_of Card, guess.card
  end

  def test_guess_has_a_response
    card  = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)

    assert_equal "Juneau", guess.response
  end

  def test_guess_is_correct
    card  = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)

    assert true, guess.correct?
  end

  def test_feedback_is_correct
    card  = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)

    assert_equal "Correct!", guess.feedback
  end

  def test_another_card
    card  = Card.new("Which planet is closest to the sun?", "Mercury")
    guess = Guess.new("Saturn", card)

    assert_instance_of Card, guess.card
    assert_equal "Saturn", guess.response
    refute guess.correct?
  end
end
