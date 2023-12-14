module Day_09
  SAMPLES_FILENAME  = "src/day_09/day_09_samples.txt"
  INPUT_FILENAME    = "src/day_09/day_09_input.txt"

  module_function

  def part_one
    data = File.read(INPUT_FILENAME).split("\n")
    total = 0
    data.map { |line|
      my_arr = []
      my_arr << line.split.map(&:to_i)
      all_arr = subtract_consecutive_elements(my_arr[0])
      all_arr.map{|a|
        total += a[-1]
      }
    }
    puts total
  end

  def subtract_consecutive_elements(array)
    result = [array]
    while array.length > 1 
      array = array.each_cons(2).map { |a, b| b - a }
      result << array
    end
    result
  end

  def part_two
    data = File.read(INPUT_FILENAME).split("\n")
    total = 0
    data.map { |line|
      my_arr = []
      my_arr << line.split.map(&:to_i)
      all_arr = subtract_consecutive_elements(my_arr[0])
      all_arr.each_with_index do |current_arr, i|
        if i.even?
          total += current_arr[0]
        else
          total -= current_arr[0]
        end
      end
    }
    puts total
  end
end

