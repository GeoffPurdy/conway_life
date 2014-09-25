class ConwayLife
  attr_reader :board

  def initialize(n)
    @board = Array.new(n**2)
  end

end
