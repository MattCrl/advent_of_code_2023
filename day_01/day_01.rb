module Day_01
  INPUT_FILENAME = "day_01/day_01_input.txt"

  module_function

  # Reading inputs
  def read_input_file(filename)
    file_data = File.read(filename)
    file_data.split("\n")
  end

  # Part 1
  def sum_calibration_values(input)
    total = 0
    input.map {|line|
      numbers = line.scan(/[0-9]+/).join('').split('')
      num = "#{numbers[0]}#{numbers[-1]}"
      total += num.to_i
    }
    total
  end

  def solve_part_one
    sum_calibration_values(read_input_file(INPUT_FILENAME))
  end

  # Part 2
  def word_numbers_to_digit_numbers(input)
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

    regex_matching_words = /(oneight|threeight|eighthree|eightwo|sevenine|fiveight|twone|one|two|three|four|five|six|seven|eight|nine)/
    transformed_input = input.map {|line|
      numbers = line.gsub(regex_matching_words, letter_to_number).scan(/[0-9]+/).join('')
    }
    transformed_input
  end

  def sum_calibration_values_part2(input)
    transformed_input = word_numbers_to_digit_numbers(input)
    sum_calibration_values(transformed_input)
  end

  def solve_part_two
    sum_calibration_values_part2(read_input_file(INPUT_FILENAME))
  end
end
