module Day_05
  SAMPLES_INPUT_FILENAME  = "day_05/day_05_samples_input.txt"
  FINAL_INPUT_FILENAME    = "day_05/day_05_final_input.txt"

  module_function

  # Reading inputs
  def read_input_file(filename)
    return nil unless File.exists?(filename)
    file_data = File.read(filename)
    file_data.split("\n")
  end

  # Part 1
  def solve_part_one
    nil
  end

  # Part 2
  def solve_part_two
    nil
  end
  
end
