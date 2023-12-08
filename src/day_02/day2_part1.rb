file_data = File.read("day2_input.txt")
game_possible_ids = []
file_data.split("\n").map{ |line|
  valid_set = true
  current_game_id = line.scan(/Game [0-9]+/).map{_1.split.last}.first.to_i
  line.split(";").map{ |set|
    blue_count  = set.scan(/[0-9]+ blue/).map{_1.split.first.to_i}.sum
    red_count   = set.scan(/[0-9]+ red/).map{_1.split.first.to_i}.sum
    green_count = set.scan(/[0-9]+ green/).map{_1.split.first.to_i}.sum
    if red_count > 12 || green_count > 13 || blue_count > 14
      valid_set = false
    end
  }
  
  if valid_set
    game_possible_ids << current_game_id
  end
}

puts game_possible_ids.sum