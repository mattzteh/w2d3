class Player
    def get_move
        p "enter a position with coordinate separated with a space like '4 7'"
        input = gets.chomp
        position = input.split(" ")
        position.map! { |ele| ele.to_i }
        position
    end
end
