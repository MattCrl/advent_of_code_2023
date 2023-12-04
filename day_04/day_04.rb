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
      numbers_i_have  = formated[1].split.map &:to_i
      common_values   = winning_numbers & numbers_i_have
      result << (2**common_values.length)/2
    }
    result.sum
  end

  def solve_part_one
    scratchcards_points_calculator(read_input_file(INPUT_FILENAME))
  end

  # Part 2
  def scratchcards_won_calculator(input)
    cards_hash = {}
    # Creating a Hash that contains each card and their count (all of them has the 1 original to start)
    (1..input.length).each do |i|
      cards_hash[i] = 1
    end
    current_card = 1
    # Mapping the input to count how many winning numbers each card has (same as part 1)
    input.map{ |line|
      formated        = line.scan(/: .+/).first.gsub(': ', '').split('|').map{_1.strip}
      winning_numbers = formated[0].split.map &:to_i
      numbers_i_have  = formated[1].split.map &:to_i
      common_values   = winning_numbers & numbers_i_have
      number_of_winning_numbers = common_values.length

      # For each winning number, adding "current_card" amount to the next n cards
      number_of_winning_numbers.times do |j|
        j += 1
        cards_hash[current_card+j] += cards_hash[current_card]
      end
      current_card += 1
    }
    # Sum all cards values to get the final result
    cards_hash.values.sum
  end

  def solve_part_two
    scratchcards_won_calculator(read_input_file(INPUT_FILENAME))
  end
end

