require_relative "conway_life.rb"

l = ConwayLife.new(9)
puts l.to_s
puts l.getNeighborCount(4,4)
