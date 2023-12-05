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
  def lowest_location_number(input)
    return nil if input.nil?
    # Seeds
    seeds = input[0].gsub('seeds: ', '').split.map &:to_i
    match = {}
    i = 1
    seeds.each do |seed|
      match[i] = seed
      i += 1
    end
    puts match

    # Seeds to soil
    seeds_to_soil = []
    soil_section = false
    input.each do |line|
      if line.strip == 'seed-to-soil map:'
        soil_section = true
        next
      end
      break if line.strip.empty? && soil_section
      seeds_to_soil << line.split.map(&:to_i) if soil_section
    end
    mapping = {}
    (0..99).each do |num|
      mapping[num] = num
    end
    seeds_to_soil.each do |toto|
      a = toto[0]
      b = toto[1]
      toto[2].times do
        mapping[b] = a
        a += 1
        b += 1
      end
    end
    match.each do |k, v|
      match[k] = mapping[v]
    end
    puts match

    # Soil to Fertilizer
    soil_to_fertilizer = []
    fertilizer_section = false
    input.each do |line|
      if line.strip == 'soil-to-fertilizer map:'
        fertilizer_section = true
        next
      end
      break if line.strip.empty? && fertilizer_section
      soil_to_fertilizer << line.split.map(&:to_i) if fertilizer_section
    end
    puts "soil_to_fertilizer #{soil_to_fertilizer}"
    mapping = {}
    (0..99).each do |num|
      mapping[num] = num
    end
    soil_to_fertilizer.each do |toto|
      a = toto[0]
      b = toto[1]
      toto[2].times do
        mapping[b] = a
        a += 1
        b += 1
      end
    end
    match.each do |k, v|
      match[k] = mapping[v]
    end
    puts match

    # Fertilizer to Water
    fertilizer_to_water = []
    water_section = false
    input.each do |line|
      if line.strip == 'fertilizer-to-water map:'
        water_section = true
        next
      end
      break if line.strip.empty? && water_section
      fertilizer_to_water << line.split.map(&:to_i) if water_section
    end
    mapping = {}
    (0..99).each do |num|
      mapping[num] = num
    end
    fertilizer_to_water.each do |toto|
      a = toto[0]
      b = toto[1]
      toto[2].times do
        mapping[b] = a
        a += 1
        b += 1
      end
    end
    match.each do |k, v|
      match[k] = mapping[v]
    end
    puts match

    # Water to Light
    water_to_light = []
    light_section = false
    input.each do |line|
      if line.strip == 'water-to-light map:'
        light_section = true
        next
      end
      break if line.strip.empty? && light_section
      water_to_light << line.split.map(&:to_i) if light_section
    end
    mapping = {}
    (0..99).each do |num|
      mapping[num] = num
    end
    water_to_light.each do |toto|
      a = toto[0]
      b = toto[1]
      toto[2].times do
        mapping[b] = a
        a += 1
        b += 1
      end
    end
    match.each do |k, v|
      match[k] = mapping[v]
    end
    puts match

    # Light to Temperature
    light_to_temperature = []
    temperature_section = false
    input.each do |line|
      if line.strip == 'light-to-temperature map:'
        temperature_section = true
        next
      end
      break if line.strip.empty? && temperature_section
      light_to_temperature << line.split.map(&:to_i) if temperature_section
    end
    mapping = {}
    (0..99).each do |num|
      mapping[num] = num
    end
    light_to_temperature.each do |toto|
      a = toto[0]
      b = toto[1]
      toto[2].times do
        mapping[b] = a
        a += 1
        b += 1
      end
    end
    match.each do |k, v|
      match[k] = mapping[v]
    end
    puts match

    # Temperature to Humidity
    temperature_to_humidity = []
    humidity_section = false
    input.each do |line|
      if line.strip == 'temperature-to-humidity map:'
        humidity_section = true
        next
      end
      break if line.strip.empty? && humidity_section
      temperature_to_humidity << line.split.map(&:to_i) if humidity_section
    end
    mapping = {}
    (0..99).each do |num|
      mapping[num] = num
    end
    temperature_to_humidity.each do |toto|
      a = toto[0]
      b = toto[1]
      toto[2].times do
        mapping[b] = a
        a += 1
        b += 1
      end
    end
    match.each do |k, v|
      match[k] = mapping[v]
    end
    puts match

    # Humidity to Location
    humidity_to_location = []
    location_section = false
    input.each do |line|
      if line.strip == 'humidity-to-location map:'
        location_section = true
        next
      end
      break if line.strip.empty? && location_section
      humidity_to_location << line.split.map(&:to_i) if location_section
    end
    mapping = {}
    (0..99).each do |num|
      mapping[num] = num
    end
    humidity_to_location.each do |toto|
      a = toto[0]
      b = toto[1]
      toto[2].times do
        mapping[b] = a
        a += 1
        b += 1
      end
    end
    match.each do |k, v|
      match[k] = mapping[v]
    end
    puts match
    puts match.values.min
  end

  def solve_part_one
    lowest_location_number(read_input_file(FINAL_INPUT_FILENAME))
  end

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


  # Part 2
  def solve_part_two
    nil
  end
  
end
