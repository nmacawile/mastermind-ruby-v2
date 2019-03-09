require_relative 'player'

class ComputerPlayer < Player

  def initialize(game, name = "Computer")
    super(game, name)
  end

  def set_code
    Array.new(4) { Code::VALID_CHARS.sample }
  end

  def list
    @list ||= Code::VALID_CHARS.repeated_permutation(4).to_a
  end

  def attempt
    eliminate_bad_codes
    pick_from_list
  end

  private

  def pick_from_list
    return if list.empty?
    Code::VALID_CHARS.each_slice(2)
     .map { |a, b| [a, a, b, b] }
     .find { |code| list.delete(code) } ||
    list.shift
  end

  def eliminate_bad_codes
    return if game.guesses.empty?
    last_guess, last_score = game.guesses.last
    list.delete_if do |code|
      CodeMatcher.test(code, last_guess) != last_score
    end
  end
end