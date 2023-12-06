module Day_05
  SAMPLES_INPUT_FILENAME  = "day_05/day_05_samples_input.txt"
  FINAL_INPUT_FILENAME    = "day_05/day_05_final_input.txt"

  module_function

  # Description de l'input :
  # Ligne 1 : Numéros des graines à planter 
  # seed-to-soil map : X lignes de 3 valeurs :
  # 1/ début de la range de destination
  # 2/ début de la range source
  # 3/ taille de la range
  # Exemple :
  # seeds: 79 14 55 13
  # seeds-to-soil map:
  # 50 98 2
  # 52 50 48
  # La première ligne de seeds-to-soil map : 50 98 2
    # Début de la range de destination égal à 50
    # Début de la range source égal à 98
    # Taille de la range égal à 2
    # Ça veut donc dire que la source commence à 98 et contient deux valeurs : 98 99
    # La source de destination fait la même taille mais commence à 50, donc 50 51
    # Avec cette info on sait qu'un graine n°98 correspond à un soil n°50, graine n°99 correpond à soil n°51
  # La deuxième ligne de seeds-to-soil map : 52 50 48
    # Début de la range de destination égal à 52
    # Début de la range source égal à 50
    # Taille de la range égal à 48
    # Ça veut donc dire que la source commence à 50 et contient 48 valeurs : 50, 51, ... 97
    # La source de destination fait la même taille mais commence à 52, donc 52, 53, ... 99
    # Avec cette info on sait qu'un graine n°53 correspond à un soil n°55
  # Chaque numéro de source qui n'est pas mappé correspond au même numéro de destination
    # Donc la graine n°10 ici correspond au soil n°10
  # À partir de là on peut construire une map :
    #   seed  soil
      # 0     0
      # 1     1
      # ...   ...
      # 48    48
      # 49    49
      # 50    52
      # 51    53
      # ...   ...
      # 96    98
      # 97    99
      # 98    50
      # 99    51
    # On sait donc ici que pour les seeds données au début (79 14 55 13) on aura :
      # seed 79 correspond au soil 81
      # seed 14 correspond au soil 14
      # seed 55 correspond au soil 57
      # seed 13 correspond au soil 13

  def lowest_location_for_seed
    input = File.read(FINAL_INPUT_FILENAME)
    seeds, *maps = input.split("\n\n")
    seeds = seeds.split[1..].map &:to_i
    # Each "maps" contains "x-to-x", "map:", then all the integers values
    # By mapping all maps and spliting them, and only keeping [2..], I remove the useless "x-to-x", "map:", and keep only every integers
    # Then, later I can map these Integers 3 by 3 (each_slice(3)) to get the values in the correct ordre
    maps = maps.map { _1.split.map(&:to_i)[2..] }

    final_locations_for_each_seed = seeds.map do |seed|
        maps.reduce(seed) do |current_location, all_ranges_of_current_map|
          # Here I check for each seed, for each slice of 3 Int (all_ranges_of_current_map : dest, range, length) in maps Array :
          # If the current_location is located BETWEEN the given range so :
          # If current_location >= source_range
          # && current_location < source_range + length_range
          # If it's between, then it mean the location will change, else it won't change so I keep the current_location unchanged
          # If there's a match, there's always be only ONE possible match, that's why I use .find, it only returns the first match
          new_location = all_ranges_of_current_map.each_slice(3).find { |(dest_range, source_range, length_range)| current_location >= source_range && current_location < source_range + length_range }
          # Calculate the new location is easy :
          # convert the current_location by substracting the source_range (new_location[1]), and by adding to destination_range (new_location[0])
          new_location ? current_location - new_location[1] + new_location[0] : current_location
        end
    end
    # Returns the lowest location among all seeds final locations
    final_locations_for_each_seed.min
  end

  def solve_part_one
    lowest_location_for_seed
  end

  # Part 2
  def lowest_location_for_seed_p2
    input = File.read(FINAL_INPUT_FILENAME)
    seeds, *maps = input.split("\n\n")
    seeds = seeds.split[1..].map &:to_i
    seeds_ranges = []
    seeds.each_slice(2) { |a, b| seeds_ranges << (a..a+b) }
    maps = maps.map { _1.split.map(&:to_i)[2..] }
    final_locations_for_each_seed = []
    seeds_ranges.map { |seed_range| 
      seed_range.each do |seed|
        final_locations_for_each_seed << maps.reduce(seed) do |current_location, all_ranges_of_current_map|
          new_location = all_ranges_of_current_map.each_slice(3).find { |(dest_range, source_range, length_range)| current_location >= source_range && current_location < source_range + length_range }
          new_location ? current_location - new_location[1] + new_location[0] : current_location
        end
      end
    }
    final_locations_for_each_seed.min
  end

  def solve_part_two
    lowest_location_for_seed_p2
  end
  
end
