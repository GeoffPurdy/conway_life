require_relative "conway_life.rb"

l = ConwayLife.new(8,0)
l.setCell(4,4,1)
l.setCell(3,3,1)
l.setCell(5,5,1)
puts l.to_s
puts "press [enter] to iterate; 'q' [enter] to exit"
while(gets.chomp != 'q')
  l.sweep_flag_reseed
  puts l.to_s
end
