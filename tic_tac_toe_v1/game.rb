
require_relative "board"
require_relative "human_player"

class Game

    def initialize(mark_1, mark_2)
        @player_1 = Human_player.new(mark_1)
        @player_2 = Human_player.new(mark_2)
        @current_player = @player_1
        @board = Board.new
    end

    def switch_turn
        if @current_player == @player_1
            @current_player = @player_2
        else
            @current_player = @player_1
        end
    end

    def play
        while @board.empty_positions?
            @board.print
            position = @current_player.get_position
            @board.place_mark(position, @current_player.mark)
            if @board.win?(@current_player.mark)
                p "Game Over. Congratulations, #{@current_player} you won!"
                return
            else
                switch_turn
            end
        end
        puts "Game Over"
        puts "Draw"
    end
end
