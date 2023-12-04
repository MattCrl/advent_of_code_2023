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

    # frame the entire input with dots
    input.insert(0,  '.' * input[0].length)
    input.insert(-1, '.' * input[0].length)
    input.each_with_index do |line, line_number|
      input[line_number] = line.center(line.length + 2, ".")
    end

    valid_parts_numbers = []
    input.each_with_index do |line, line_number|
      nums_and_positions = line.enum_for(:scan, /[\d]+/).map { [Regexp.last_match.to_s, Regexp.last_match.begin(0)] }
      nums_and_positions.each do |current_number, position|
        chars_above_nums = input[line_number - 1].slice(position - 1..position + current_number.length)
        chars_left_nums  = line[position - 1]
        chars_right_nums = line[position + current_number.length]
        chars_below_nums = input[line_number + 1].slice(position - 1..position + current_number.length)
        all_chars_around_num = chars_above_nums + chars_left_nums + chars_right_nums + chars_below_nums
        valid_parts_numbers.push current_number.to_i unless all_chars_around_num.scan(/[^\.\d]/).empty?
      end
    end
    valid_parts_numbers.sum
  end

  def solve_part_one
    sum_parts_engine_schematic(read_input_file(INPUT_FILENAME))
  end

  # Part 2
  def sum_parts_engine_schematic_p2(input)
    return nil if input.nil?

    # frame the entire input with dots
    input.insert(0,  '.' * input[0].length)
    input.insert(-1, '.' * input[0].length)
    input.each_with_index do |line, line_number|
      input[line_number] = line.center(line.length + 2, ".")
    end

    stars_positions_and_their_adj_numbers = {}
    input.each_with_index do |line, line_number|
      nums_and_positions = line.enum_for(:scan, /[\d]+/).map { [Regexp.last_match.to_s, Regexp.last_match.begin(0)] }
      nums_and_positions.each do |current_number, position|
        chars_above_nums = input[line_number - 1].slice(position - 1..position + current_number.length)
        chars_left_nums  = line[position - 1]
        chars_below_nums = input[line_number + 1].slice(position - 1..position + current_number.length)
        chars_right_nums = line[position + current_number.length]
        all_chars_around_num = chars_above_nums + chars_left_nums + chars_below_nums + chars_right_nums
        if all_chars_around_num.scan(/[\*]/).length > 0
          x = line_number
          y = position
        
          # This current number has a * around it
          # I need to save in a Hash the star position as the key, and create an Array of every current_number associated to this star
          # Then later, I'll filter this Hash keeping only key/values where value is an Array of exactly length == 2 (star associated to 2 numbers only)
          if chars_above_nums.scan(/[\*]/).length > 0
            x -= 1
            portion = all_chars_around_num[0..current_number.length+2]
            index = portion.index('*')
            index_in_line = position + index - 1
            y = index_in_line
            if stars_positions_and_their_adj_numbers["#{x}:#{y}"].nil?
              stars_positions_and_their_adj_numbers["#{x}:#{y}"] = [current_number]
            else
              stars_positions_and_their_adj_numbers["#{x}:#{y}"] << current_number
            end
          end

          if chars_left_nums.scan(/[\*]/).length > 0
            y = position - 1
            if stars_positions_and_their_adj_numbers["#{x}:#{y}"].nil?
              stars_positions_and_their_adj_numbers["#{x}:#{y}"] = [current_number]
            else
              stars_positions_and_their_adj_numbers["#{x}:#{y}"] << current_number
            end
          end

          if chars_right_nums.scan(/[\*]/).length > 0
            y = position + current_number.length
            if stars_positions_and_their_adj_numbers["#{x}:#{y}"].nil?
              stars_positions_and_their_adj_numbers["#{x}:#{y}"] = [current_number]
            else
              stars_positions_and_their_adj_numbers["#{x}:#{y}"] << current_number
            end
          end

          if chars_below_nums.scan(/[\*]/).length > 0
            x += 1
            portion = all_chars_around_num[(all_chars_around_num.length/2)..-2]
            index = portion.index('*')
            index_in_line = position + index - 1
            y = index_in_line
            if stars_positions_and_their_adj_numbers["#{x}:#{y}"].nil?
              stars_positions_and_their_adj_numbers["#{x}:#{y}"] = [current_number]
            else
              stars_positions_and_their_adj_numbers["#{x}:#{y}"] << current_number
            end
          end
        end
      end
    end
    stars_positions_and_their_adj_numbers = stars_positions_and_their_adj_numbers.filter {|k, v| v.length == 2}
    total = 0
    stars_positions_and_their_adj_numbers.map {|k, v|
      v = v.map &:to_i
      total += v.reduce(:*)
    }
    total
  end

  def solve_part_two
    sum_parts_engine_schematic_p2(read_input_file(INPUT_FILENAME))
  end
end
