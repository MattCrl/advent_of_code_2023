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
      nums_and_positions.each do |partnum, position|
        chars_above_nums = input[line_number - 1].slice(position - 1..position + partnum.length)
        chars_left_nums  = line[position - 1]
        chars_right_nums = line[position + partnum.length]
        chars_below_nums = input[line_number + 1].slice(position - 1..position + partnum.length)
        all_chars_around_num = chars_above_nums + chars_left_nums + chars_right_nums + chars_below_nums
        valid_parts_numbers.push partnum.to_i unless all_chars_around_num.scan(/[^\.\d]/).empty?
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
      nums_and_positions.each do |partnum, position|
        chars_above_nums = input[line_number - 1].slice(position - 1..position + partnum.length)
        chars_left_nums  = line[position - 1]
        chars_below_nums = input[line_number + 1].slice(position - 1..position + partnum.length)
        chars_right_nums = line[position + partnum.length]
        all_chars_around_num = chars_above_nums + chars_left_nums + chars_below_nums + chars_right_nums
        if all_chars_around_num.scan(/[\*]/).length > 0
          puts all_chars_around_num
          # Ce numéro a une * autour de lui
          # Il faudrait que j'enregistre dans mon Hash la position de l'étoile en clé, et mettre le num (valeur) dans un tableau associé à la clé
          if chars_above_nums.scan(/[\*]/).length > 0
          end
          if chars_left_nums.scan(/[\*]/).length > 0
          end
          if chars_right_nums.scan(/[\*]/).length > 0
          end
          if chars_below_nums.scan(/[\*]/).length > 0
            puts chars_below_nums.index('*')
          end
        end
          
      end

    end
    puts "result"
  end

  def solve_part_two
    sum_parts_engine_schematic_p2(read_input_file(INPUT_FILENAME))
  end
end
