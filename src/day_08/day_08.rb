module Day_08
  SAMPLES_FILENAME  = "src/day_08/day_08_samples.txt"
  INPUT_FILENAME    = "src/day_08/day_08_input.txt"
  START   = "AAA"
  FINISH  = "ZZZ"

  module_function

  def part_one
    directions, coords = File.read(INPUT_FILENAME).split("\n\n")
    directions = directions.split('').map{ _1 == "L" ? 0 : 1 }
    mh = Hash.new
    coords.split("\n").map { |line|
      key, left_value, right_value = line.scan(/[A-Z]{3}/)
      mh[key] = [left_value, right_value]
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
    directions, coords = File.read(INPUT_FILENAME).split("\n\n")
    directions = directions.split('').map{ _1 == "L" ? 0 : 1 }
    mh = Hash.new
    coords.split("\n").map { |line|
      key, left_value, right_value = line.scan(/[A-Z]{3}/)
      mh[key] = [left_value, right_value]
    }
    # Récupérer tous les départs (tous ceux qui finissent par A)
    # Les mettres dans un tableau
    starting_points = mh.keys.filter { _1[2] == "A"}
    # faire une loop infinie
    n_times = []
    starting_points.each do |z|
      j = 0
      current = z
      modified_direction = directions
      loop do 
        next_stop = mh[current][modified_direction[0]]
        modified_direction = modified_direction.rotate
        current = next_stop
        j += 1
        if current[2] == "Z"
          n_times << j
          break
        end
      end
    end
    puts n_times.reduce(:lcm)
  end
end

