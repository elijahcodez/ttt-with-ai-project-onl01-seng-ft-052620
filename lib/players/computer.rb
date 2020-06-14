require 'pry'

module Players
  
    class Computer < Player
        def move(board)
            moves = [0,1,2,3,4,6,7,8]
            if !board.valid_move?(5)
                move = moves.sample;
                if move = moves.sample; board.valid_move?(move)
                    move+=1
                    move = move.to_s
            end

            else move = '5'
            end
        end
    end
end