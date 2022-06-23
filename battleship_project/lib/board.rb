class Board

    attr_reader :size

    def self.print_grid(grid)
        
        grid.each do |row|
            puts row.join(" ")
        end   
    end

    def initialize(n)
        @grid = Array.new(n) {Array.new(n, :N)}
        @size = n * n
    end

    def [](indices)
        @grid[indices[0]][indices[1]]
    end

    def []=(position, value)
        @grid[position[0]][position[1]] = value
    end

    def num_ships
        count = 0
        @grid.each do |row|
            row.each do |column|
                if column == :S 
                    count += 1
                end
            end
        end
        count
    end

    def attack(position)
        if self[position] == :S
            self[position] = :H
            p "you sunk my battleship!"
            return true
        else
            self[position] = :X
            return false
        end
    end

    def place_random_ships
        ships = @size * 0.25

        while self.num_ships < ships
            random_row = rand(0...@grid.length)
            random_col = rand(0...@grid.length)
            position = [random_row, random_col]
            self[position] = :S
        end
    end

    def hidden_ships_grid
        @grid.map do |row|
            row.map do |col|
                if col == :S
                    :N
                else
                    col
                end
            end
        end
    end


    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end
end
