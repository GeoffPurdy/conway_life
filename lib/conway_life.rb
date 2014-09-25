class ConwayLife
  attr_reader :board
  attr_reader :side

  def initialize(n)
    @side = n
    @board = Array.new(@side**2)
  end

  def setCell(row, col, val)
    pos = (row * @side) + col
    @board[pos] = val
  end

  def getCell(row,col)
    pos = (row * @side) + col
    return @board[pos]
  end

end
