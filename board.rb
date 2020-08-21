class Board
    attr_reader :grid

    def initialize
        @grid = Array.new(9) {' '}
    end

    def display_grid()
        puts " #{@grid[0]} | #{@grid[1]} | #{@grid[2]} "
        puts "-----------"
        puts " #{@grid[3]} | #{@grid[4]} | #{@grid[5]} "
        puts "-----------"
        puts " #{@grid[6]} | #{@grid[7]} | #{@grid[8]} "
    end

    def set_cell(position, value)
        @grid[position.to_i - 1] = value
    end
    
    def draw?
        grid.none? { |cell| cell == ' ' }
    end

    def winner?
        win_combinations.each do |win_combination|
          next if win_combination.all? { |combination_value| @grid[combination_value] == ' ' }
          return true if win_combination.all? { |combination_value| @grid[combination_value] == @grid[win_combination[0]] }
        end
        false
    end

    def game_over?
        true if (winner? || draw?)
    end

    def invalid_position?(position)
        !position.to_i.between?(1,9)
    end

    def position_taken?(position)

        if (@grid[position.to_i - 1] == ' ')
           return false 
        else
           return true
        end
    end

    def get_empty_positions
        @grid.each_with_index.inject([]) { |acc, (el, ind)|
            acc << ind + 1 if el == ' '
            acc
        }
    end

    private

    def win_combinations
        [
            [0, 1, 2],
            [3, 4, 5],
            [6, 7, 8],
            [0, 3, 6],
            [1, 4, 7],
            [2, 5, 8],
            [0, 4, 8],
            [2, 4, 6]
        ]
    end
end