class Player
  attr_accessor :name, :game

  def initialize(game, name = "Player")
    @game = game
    @name = name
  end
end