require 'pry'


class Game
    attr_accessor :board, :player_1, :player_2

WIN_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 4, 6]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    @board.turn_count%2 ==0 ? self.player_1 : self.player_2 
  end

  def won?
    WIN_COMBINATIONS.detect do |combo| @board.cells[combo[0]] != " " &&
        @board.cells[combo[0]] == @board.cells[combo[1]] &&
        @board.cells[combo[1]] == @board.cells[combo[2]]
      end
  end

  def draw?
    !won? && @board.full? ? true : false
  end

  def over?
    draw? || won?
  end

  def winner
    won? ? @board.cells[won?[0]] : nil
  end

    def turn
        player = current_player
        puts "Howdy #{player.token} you are up!"
        @board.display
        input = player.move(@board)
        if @board.valid_move?(input)
        @board.update(input, player)
        else 
            puts"Invalid move, please try another"
            turn
        end
    end

    def play
        while !over?
            turn
          end
          if won?
            puts ''
            @board.display
            puts "Congratulations #{winner}!"
          else
            puts "Cat's Game!"
          end
    end
   
        #if won? ? "Congratulations #{winner}!" : turn
        # else 
        # puts won? ? "Congratulations #{winner}!" : "Cats Game"
        # end



end