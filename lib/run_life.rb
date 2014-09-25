require_relative "conway_life.rb"

l = ConwayLife.new(8)
l.setCell(4,4,'x') # mark for printout in testing
l.setCell(3,3,1)
l.setCell(5,5,1)
puts l.to_s
puts l.getNeighborCount(4,4)
l.sweep_and_flag
puts l.get_sweep
