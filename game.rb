class Game
  MAX_ATTEMPTS = 12

  attr_accessor :code_setter, :guesser, :guesses

  def initialize(code_setter_class, guesser_class)
    @code_setter = code_setter_class.new(self, "Code Setter")
    @guesser = guesser_class.new(self, "Guesser")
    @guessed = false
    @guesses = []
  end

  def play
    puts "#{code_setter.name}, please set a secret code."
    self.code = Code.new(code_setter.set_code)
    puts "The code is set. #{guesser.name}, you have #{MAX_ATTEMPTS} attempts."
    until over?
      attempt = guesser.attempt
      score = evaluate(attempt)
      print_response(attempt, score)
    end
  end

  def over?
    guessed? || out_of_attempts?
  end

  def guessed?
    @guessed
  end

  def out_of_attempts?
    guesses.size >= MAX_ATTEMPTS
  end

  private

  attr_accessor :code

  def evaluate(attempt)
    score = code.test(attempt)
    guesses << [attempt, score]
    @guessed = true if score == [4, 0]
    score
  end

  def print_response(attempt, score)
    puts "    #{attempt} => #{score}"
    if guessed?
      puts "#{guesser.name} guessed it in #{guesses.size} attempt(s)!"
    elsif out_of_attempts?
      puts "#{guesser.name} failed to guess it in #{MAX_ATTEMPTS} attempts."
      puts "The secret code is [#{code}]"
    end
  end
end