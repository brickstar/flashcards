class Guess
  attr_reader :response,
              :card

  def initialize(response, card)
    @response  = response
    @card      = card
  end

  def correct?
    if @response.downcase == card.answer.downcase
      true
    else
      false
    end
  end #return true if @response == card.answer

  def feedback
    if correct?
      "Correct!"
    else
      "Incorrect."
    end #return "Correct!" if correct? \n"Incorrect."
  end
end
