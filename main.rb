require_relative 'code'
require_relative 'helper'
require_relative 'code_matcher'
require_relative 'human_player'
require_relative 'computer_player'
require_relative 'game'

PLAYER_TYPES = { '1' => ComputerPlayer, '2' => HumanPlayer }

def prompt_player_type(default)
  puts "    [1] Computer"
  puts "    [2] Human "
  print "Input (default: #{default}): "
  PLAYER_TYPES[gets.chomp] || PLAYER_TYPES[default]
end

puts "Who will set the secret code?: "
setter_type = prompt_player_type('1')

puts "Who will guess the secret code?: "
guesser_type = prompt_player_type('2')

game = Game.new(setter_type, guesser_type)
game.play