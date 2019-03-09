class Code
  VALID_CHARS = (1..6).to_a

  attr_reader :code
  
  def initialize(code)
    @code = code
  end
  
  def test(guess)
    CodeMatcher.test(code, guess)
  end

  def is_valid?
    Code.valid?(code)
  end

  def to_s
    code.join(' ')
  end

  def self.valid?(code)
    code.size == 4 && code.all? { |e| VALID_CHARS.include?(e) }
  end
end