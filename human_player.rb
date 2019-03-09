require_relative 'player'

class HumanPlayer < Player
  def initialize(game, name = "Human")
    print "#{name}, what is your name?: "
    new_name = gets.chomp
    name = !new_name.empty? ? new_name : name
    super(game, name)
  end

  def set_code(prompt = "Enter a secret code: ")
    code = user_input(prompt)
    return code if valid?(code)
    print_invalid_code_message
    set_code(prompt)
  end

  def attempt
    attempt_number = game.guesses.size
    set_code("Attempt #{attempt_number + 1}. Guess the secret code: ")
  end

  private

  def user_input(prompt)
    print prompt
    gets.chomp.scan(/\d+/).map(&:to_i)
  end

  def print_invalid_code_message
    puts "Invalid code. Please try again."
    puts "Please enter 4 integers between 1 and 6 separated by spaces. e.g. 1 2 3 6"
  end

  def valid?(code)
    Code.valid?(code)
  end
end