class ConwayLife
  attr_reader :board
  attr_reader :side

  def initialize(n,c=0)
    @side = n
    @board = Array.new(@side**2,c) # create and init all elements to c
  end

  def linearize(row, col)
    return (row * @side) + col
  end

  def setCell(row, col, val)
    pos = linearize(row, col)
    @board[pos] = val
  end

  def getCell(row,col)
    pos = linearize(row, col)
    return @board[pos]
  end

  def getNeighborCount(row, col)
    count = 0
    pos = linearize(row, col)
    adjacent = [(pos-@side-1), (pos-@side), (pos-@side+1), (pos-1), (pos+1), (pos+@side-1), (pos+@side), (pos+@side+1)]
    # ^ FIXME this is ugly
    adjacent.each do  |a|
      count += (@board[a].to_i > 0 ? 1 : 0)
    end
    return count
  end

  def calc_next_generation(n)
    if n <= 1
      return 0
    elsif 2 == n
      return 1
    elsif 3 == n
      return 1
    else
      return 0
    end
  end

  def sweep_flag_reseed
    sweep = []
    @side.times do |i|
      @side.times do |j|
        sweep[ linearize(i,j) ] = getNeighborCount(i,j)
      end
    end

    @side.times do |i|
      @side.times do |j|
        k = linearize(i,j)
        @board[ k ] = calc_next_generation( sweep[ k ] )
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

  private     :linearize
end
