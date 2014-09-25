require "minitest/autorun"
require "conway_life"

class ConwayLifeTest < Minitest::Unit::TestCase
  def test_board_exists
    life = ConwayLife.new(8)
    assert life.board
  end

  def test_board_dimensions
    life = ConwayLife.new(4)
    assert 4 == life.side
  end

  def test_board_is_square
    life = ConwayLife.new(9)
    assert Math.sqrt(life.board.size) == life.side
  end

  def test_set_get_cell
    side = 9
    life = ConwayLife.new(side)
    value = 55
    x = 1
    y = 2
    life.setCell(x,y,value)
    assert life.getCell(x,y) == value
  end

  def test_get_cell_neighbor_count_no_edges
    life = ConwayLife.new(8)
    assert 0 == life.getNeighborCount(4,4)
  end

  def test_get_cell_neighbor_count_all_edges
    life = ConwayLife.new(1)
    assert 0 == life.getNeighborCount(0,0)
  end

  def test_get_cell_neighbor_count_all_borders
    life = ConwayLife.new(3)
    assert 0 == life.getNeighborCount(1,1)
  end

end
