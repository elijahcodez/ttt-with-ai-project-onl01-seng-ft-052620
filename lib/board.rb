class Board
    attr_accessor :cells 
    
    def initialize
        @cells = Array.new(9, " ")
    end

    def reset!
        @cells = Array.new(9," ")
    end

    def display
        puts (" #{@cells[0]} | #{@cells[1]} | #{@cells[2]} ")
        puts ("-----------")
        puts (" #{@cells[3]} | #{@cells[4]} | #{@cells[5]} ")
        puts ("-----------")
        puts (" #{@cells[6]} | #{@cells[7]} | #{@cells[8]} ")
    end

    def position(input)
        input = input.to_i-1
        @cells[input]
    end

    def full?
        @cells.detect{|p| p==" "} ? false : true
    end

    def turn_count
        @cells.count{|c| c!=" "}
    end

    def taken?(num)
        position(num)!=" "
    end

    def valid_move?(num)
        num.to_i <= 9 && num.to_i >= 1 && taken?(num) == false
    end

    def update(cell, player)
        # binding.pry
        if valid_move?(cell)  
            cell= cell.to_i-1
            @cells[cell] = player.token
        else "invalid move"
            end
    end

    
    
end