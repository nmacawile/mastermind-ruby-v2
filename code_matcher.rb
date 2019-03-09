module CodeMatcher
  class << self
    def test(code, guess)
      direct = direct_matches(code, guess)
      indifferent = indifferent_matches(code, guess)
      [direct, indifferent - direct]
    end

    def direct_matches(code, guess)
      code.zip(guess).map { |c, g| c == g }.count(true)
    end

    def indifferent_matches(code, guess)
      guess_ = guess.dup
      code.each { |c| guess_.delete_first_match!(c) }
      4 - guess_.count
    end
  end
end