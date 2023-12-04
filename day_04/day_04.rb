module Day_04
  INPUT_FILENAME = "day_04/day_04_input.txt"

  module_function

  # Reading inputs
  def read_input_file(filename)
    return nil unless File.exists?(filename)
    file_data = File.read(filename)
    file_data.split("\n")
  end

  def scratchcards_points_calculator(input)
    return nil if input.nil?
  end
end