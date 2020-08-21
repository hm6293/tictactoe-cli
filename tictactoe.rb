require './game.rb'
require './player.rb'

puts "Welcome to tic tac toe"
puts "Please enter your name:"
player_name = gets.chomp
player1 = Player.new(symbol: "X", name: player_name)

# Setting system as second player
player2 = Player.new(symbol: "O", name: "System")

#Initializing the game with two players
Game.new([player1, player2]).play

