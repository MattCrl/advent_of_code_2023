file_data = File.read("day2_input.txt")
sets_power = []
file_data.split("\n").map{ |line|
  max_blue, max_red, max_green = 0, 0, 0
  line.split(";").map{ |set|
    blue_count  = set.scan(/[0-9]+ blue/).map{_1.split.first.to_i}.sum
    red_count   = set.scan(/[0-9]+ red/).map{_1.split.first.to_i}.sum
    green_count = set.scan(/[0-9]+ green/).map{_1.split.first.to_i}.sum
    max_blue  = blue_count > max_blue ? blue_count : max_blue
    max_red   = red_count > max_red ? red_count : max_red
    max_green = green_count > max_green ? green_count : max_green
  }
  sets_power << (max_blue * max_red * max_green)
}

puts sets_power.sum