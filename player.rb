class Player
  attr_reader :symbol, :name
  def initialize(playerInfo)
    @symbol = playerInfo[:symbol]
    @name = playerInfo[:name]
  end
end