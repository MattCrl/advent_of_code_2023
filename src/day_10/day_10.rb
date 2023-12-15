module Day_10

  module_function

  SAMPLES_FILENAME  = "src/day_10/day_10_samples.txt"
  INPUT_FILENAME    = "src/day_10/day_10_input.txt"

  def part_one(file)
    grid = File.read(file).split("\n")
    grid = grid.map{".#{_1}."}
    grid = grid.unshift("."*(grid[1].length))
    grid = grid.push("."*(grid[1].length))
    # On commence par le point de départ : S
    sp = [] # sp = starting point
    grid.each_with_index do |line, i|
      if line.index("S")
        sp = [i, line.index("S")]
      end
    end
    b = true
    number_of_steps = 0
    current_step = grid[sp[0]][sp[1]]
    previous_direction = ""

    while b
      case current_step
      when "S"
        if number_of_steps > 0
          # on est revenu au point de départ, fin
          b = false
        else
          sp = [sp[0], sp[1] + 1]
          current_step = grid[sp[0]][sp[1]]
          number_of_steps += 1
          previous_direction = "left"
        end
      when "F"
        if previous_direction == "down"
          sp = [sp[0], sp[1] + 1]
          current_step = grid[sp[0]][sp[1]]
          number_of_steps += 1
          previous_direction = "left"
        else
          sp = [sp[0] + 1, sp[1] ]
          current_step = grid[sp[0]][sp[1]]
          number_of_steps += 1
          previous_direction = "top"
        end
      when "-"
        if previous_direction == "right"
          sp = [sp[0], sp[1] - 1]
          current_step = grid[sp[0]][sp[1]]
          number_of_steps += 1
          previous_direction = "right"
        else
          sp = [sp[0], sp[1] + 1]
          current_step = grid[sp[0]][sp[1]]
          number_of_steps += 1
          previous_direction = "left"
        end
      when "|"
        if previous_direction == "top"
          sp = [sp[0] + 1, sp[1]]
          current_step = grid[sp[0]][sp[1]]
          number_of_steps += 1
          previous_direction = "top"
        else
          sp = [sp[0] - 1, sp[1]]
          current_step = grid[sp[0]][sp[1]]
          number_of_steps += 1
          previous_direction = "down"
        end
      when "L"
        if previous_direction == "top"
          sp = [sp[0], sp[1] + 1]
          current_step = grid[sp[0]][sp[1]]
          number_of_steps += 1
          previous_direction = "left"
        else
          sp = [sp[0] - 1, sp[1]]
          current_step = grid[sp[0]][sp[1]]
          number_of_steps += 1
          previous_direction = "down"
        end
      when "J"
        if previous_direction == "left"
          sp = [sp[0] - 1, sp[1]]
          current_step = grid[sp[0]][sp[1]]
          number_of_steps += 1
          previous_direction = "down"
        else
          sp = [sp[0], sp[1] - 1]
          current_step = grid[sp[0]][sp[1]]
          number_of_steps += 1
          previous_direction = "right"
        end
      when "7"
        if previous_direction == "left"
          sp = [sp[0] + 1, sp[1]]
          current_step = grid[sp[0]][sp[1]]
          number_of_steps += 1
          previous_direction = "top"
        else
          sp = [sp[0], sp[1] - 1]
          current_step = grid[sp[0]][sp[1]]
          number_of_steps += 1
          previous_direction = "right"
        end
      end
      puts "current_step #{current_step}" 
      puts "previous_direction #{previous_direction}" 
      puts "number_of_steps #{number_of_steps}"
    end
    number_of_steps / 2
  end

  def solve_part_one_samples
    part_one(INPUT_FILENAME)
  end
end
