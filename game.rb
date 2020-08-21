require './board.rb'

class Game

  attr_reader :board, :current_player, :other_player

  def initialize(players)
    @board = Board.new
    @current_player, @other_player = players.shuffle
  end

  def switch_players
    @current_player, @other_player = @other_player, @current_player
  end

  def play
    puts "#{@current_player.name} has randomly been selected as the first player"
    
    # The loop continues untill game is either won or drew
    while true
      board.display_grid
      puts ""
      puts "#{@current_player.name}: Enter a number between 1 and 9 to make your move"

      if @current_player.name === "System"
        position = board.get_empty_positions.sample
      else
        position = gets.chomp
      end


      if board.invalid_position?(position)
        puts "Please enter a valid position between 1-9"
        next
      elsif board.position_taken?(position)
        puts "Position #{position} is already taken, please choose another position"
        next
      else
        board.set_cell(position, @current_player.symbol)
      end
      
      if board.game_over?
        puts game_over_message
        board.display_grid
        return
      else
        switch_players
      end
    end
  end

  def game_over_message
    return "#{@current_player.name} won!" if board.winner?
    return "The game ended in a tie" if board.draw?
  end

end