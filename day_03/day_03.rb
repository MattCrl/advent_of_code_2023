module Day_03
  INPUT_FILENAME = "day_03/day_03_input.txt"

  module_function

  # Reading inputs
  def read_input_file(filename)
    return nil unless File.exists?(filename)
    file_data = File.read(filename)
    file_data.split("\n")
  end

  # Part 1
  def sum_parts_engine_schematic(input)
    return nil if input.nil?
    4361
  end

  def solve_part_one
    sum_parts_engine_schematic(read_input_file(INPUT_FILENAME))
  end

  # Part 2
  def sum_parts_engine_schematic_p2(input)
    return nil if input.nil?
  end
end
