class ConwayLife
  attr_reader :board
  attr_reader :side
  # private     :linearize

  def initialize(n)
    @side = n
    @board = Array.new(@side**2,0) # create and init all elements to 0
  end

  def linearize(row, col)
    return (row * @side) + col
  end

  def setCell(row, col, val)
    pos = self.linearize(row, col)
    @board[pos] = val
  end

  def getCell(row,col)
    pos = self.linearize(row, col)
    return @board[pos]
  end

  def getNeighborCount(row, col)
    count = 0
    pos = linearize(row, col)
    adjacent = [(pos-@side-1), (pos-@side), (pos-@side+1), (pos-1), (pos+1), (pos+@side-1), (pos+@side), (pos+@side+1)]
    adjacent.each do  |a|
      count += (@board[a].to_i > 0 ? 1 : 0)
    end
    return count
  end

  def sweep_and_flag
    @sweep = []
    @side.times do |i|
      @side.times do |j|
        @sweep[ linearize(i,j) ] = getNeighborCount(i,j)
      end
    end
  end

  def to_square_matrix(len, arr)
    out = ""
    len.times do |i|
      len.times do |j|
        delim = 0==(j % len) ? "\n" : ','
        out << delim + arr[ linearize(i,j) ].to_s
      end
    end
    return out
  end

  def to_s
    return to_square_matrix(@side, @board)
  end

  def get_sweep
    return to_square_matrix(@side, @sweep)
  end
end
