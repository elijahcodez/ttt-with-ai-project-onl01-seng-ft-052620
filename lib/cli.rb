class Cli

    def intro
        puts "Howdy folks, Grand to greet you and Play Tic Tac Toe!"
        puts "First off, do you want to play against another Human, or an AI mastermind? If you even fancy it you can make the computer fight itself!"
        puts "Input 'Human' for another person, 'AI' for a sinister robot or 'Comp' for an epic computer battle for the ages!"
        input = gets.strip
        if input.downcase == 'human'
            Game.new.play
        elsif input.downcase == 'ai' 
            Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O")).play
        elsif input.downcase == 'comp'
            Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O")).play
        end
    end
end