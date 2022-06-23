class Human_player

    attr_reader :mark
    
    def initialize(value)
        @mark = value
    end

    def get_position
        p "Player #{mark.to_s} it is your turn! Enter your position as two numbers with a space between them."
        position = gets.chomp.split(" ").map(&:to_i)
        raise "invalid input" if position.length != 2
        position
    end
end