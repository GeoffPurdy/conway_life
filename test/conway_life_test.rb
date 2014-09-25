require "minitest/autorun"
require "conway_life"

class ConwayLifeTest < Minitest::Test
  def test_universe_exists
    life = ConwayLife.new
    assert life.state
  end
end
