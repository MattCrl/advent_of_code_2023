module Day_08
  SAMPLES_FILENAME  = "day_08/day_08_samples.txt"
  INPUT_FILENAME    = "day_08/day_08_input.txt"
  START   = "AAA"
  FINISH  = "ZZZ"

  module_function

  def part_one
    directions, coords = File.read(INPUT_FILENAME).split("\n\n")
    directions = directions.split('').map{ _1 == "L" ? 0 : 1 }
    mh = Hash.new
    coords.split("\n").map { |line|
      key, left_value, right_value = line.scan(/[A-Z]{3}/)
      mh[key] = [line[left_value], line[right_value]]
    }
    j = 0
    current = START
    loop do 
      next_stop = mh[current][directions[0]]
      directions = directions.rotate
      current = next_stop
      j += 1
      break if current == FINISH
    end
    j
  end

  def part_two
  end
end