require "minitest/autorun"
require "conway_life"

class ConwayLifeTest < Minitest::Unit::TestCase
  def test_board_exists
    life = ConwayLife.new(8)
    assert life.board
  end

#  def test_board_dimensions
#    life = ConwayLife.new(4)
#    assert 4 == life.side
#  end

end
