
class Board

    def initialize
        @grid = Array.new(3) {Array.new(3, "_")}
    end

    def [](position)
        row, col = position
        @grid[row][col]
    end

    def []=(position, value)
        row, col = position
        @grid[row][col] = value
    end

    def empty?(position)
        self[position] == "_"
    end
    
    def valid?(position)
        row, col = position
        if row < 0 || row > 3 ||
            col < 0 || col > 3
            return false
        else
            return true
        end
    end

    def place_mark(position, mark)
        raise "Invalid Mark" if !empty?(position) || !valid?(position)
        self[position] = mark
    end

    def print
        @grid.each do |row|
            puts row.join(" ")
        end
    end

    def win_row?(mark)
        @grid.any? {|row| row.all?(mark)}
    end
    
    def win_col?(mark)
        @grid.transpose.any? {|col| col.all?(mark)}
    end

    def win_diagonal?(mark)
        if self[0][0] == mark && self[1][1] == mark && self[2][2] == mark ||
            self[0][2] == mark && self[1][1] == mark && self[2][0] == mark
            return true
        end
    end

    def win?(mark)
        win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        count = 0
        @grid.each do |row|
            row.each do |ele|
                if ele == "_"
                    count += 1
                end
            end
        end
        if count > 0
            return true
        else
            return false
        end
    end



end
 
