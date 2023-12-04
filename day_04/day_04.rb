module Day_04
  INPUT_FILENAME = "day_04/day_04_input.txt"

  module_function

  # Reading inputs
  def read_input_file(filename)
    return nil unless File.exists?(filename)
    file_data = File.read(filename)
    file_data.split("\n")
  end

  # Part 1
  def scratchcards_points_calculator(input)
    return nil if input.nil?
    result = []
    input.map{|line|
  
      formated = line.scan(/: .+/).first.gsub(': ', '').split('|').map{_1.strip}
      winning_numbers = formated[0].split.map &:to_i
      numbers_i_have = formated[1].split.map &:to_i
      common_values = winning_numbers & numbers_i_have
      result << (2**common_values.length)/2
    }
    result.sum
  end

  def solve_part_one
    scratchcards_points_calculator(read_input_file(INPUT_FILENAME))
  end

  # Part 2
  def solve_part_two
    nil
  end

end

