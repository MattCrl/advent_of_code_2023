# Partie 1
# file = File.open("day1_input.txt")
# file_data = File.read(file)
# total = 0
# file_data.split.map {|line|
#   numbers = line.scan(/[0-9]+/).join('').split('')
#   num = "#{numbers[0]}#{numbers[-1]}"
#   total += num.to_i
# }

# Partie 2
letter_to_number = {
  "oneight" => "18",
  "threeight" => "38",
  "eighthree" => "83",
  "eightwo" => "82",
  "sevenine" => "79",
  "fiveight" => "58",
  "twone" => "21",
  "one" => "1",
  "two" => "2",
  "three" => "3",
  "four" => "4",
  "five" => "5",
  "six" => "6",
  "seven" => "7",
  "eight" => "8",
  "nine" => "9"
}

file = File.open("day1_input.txt")
file_data = File.read(file)
total = 0
file_data.split.map {|line|
  numbers = line.gsub(/(oneight|threeight|eighthree|eightwo|sevenine|fiveight|twone|one|two|three|four|five|six|seven|eight|nine)/, letter_to_number).scan(/[0-9]+/).join('')
  num = "#{numbers[0]}#{numbers[-1]}"
  total += num.to_i
}

puts total
