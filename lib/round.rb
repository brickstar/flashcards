class Round
  attr_reader :deck,
              :guesses


  def initialize(deck)
    @deck         = deck
    @guesses      = []
    @card_index   = 0

  end

  def current_card
    @deck.cards[@card_index]
  end

  def record_guess(user_answer)
    guess = Guess.new(user_answer, current_card)
    @guesses << guess
    guess
  end

  def number_correct
    count = 0
    @guesses.each do |guess|
      if guess.correct?
        count += 1
      end
    end
    count
  end

end
