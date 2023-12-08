module Day_07
  SAMPLES_FILENAME  = "src/day_07/day_07_samples.txt"
  INPUT_FILENAME    = "src/day_07/day_07_input.txt"

  module_function

  # Part 1
  def part_one(file)
    file_data = File.read(file)
    card_power = ["2", "3", "4", "5", "6", "7", "8", "9", "T", "J", "Q", "K", "A"]
    hash_data = []
    hash_data << file_data.split("\n").map{ |a| 
      a = a.split
      # L'idée ici c'est de convertir chaque main avec des lettres en fonction de la puissance de chaque carte
      # Le tableau card_power liste les cartes par ordre de puissance
      # Par exemple, ici, un 2 vaut la lettre "A", un 3 la lettre "B", etc.
      # De cette manière c'est plus simple ensuite de trier : par score, puis par "hand_power" et d'avoir les mains dans le bon ordre
      hand_power = a[0].chars.map { |char| (65 + card_power.index(char)).chr }.join
      # Pour calculer le score d'une main, je fais un tally sur la main
      # Je récupère donc le nombre d'occurence de chaque carte
      # Je trie le tableau généré sur les valeurs, je le reverse, je joins les valeurs ensemble et je rajoute des 0 jusqu'à avoir 5 caractères
      # Exemple :
      # Une main "AAAQQ" me donnera {"A" => 3, "Q" => 2}, je joins les valeurs donc 32 et je rajoute des 0 : 32000
      # Une main "23456" me donnera {"2" => 1, "3" => 1, etc.}, je joins les valeurs donc : 11111 (plus petit score possible, aucune paire)
      hand_score =  a[0].split('').tally.sort_by{|k, v| v}.reverse.map{_1[1].to_s}.join.ljust(5, '0').to_i
      {bid: a[1].to_i, hand_power: hand_power, hand_score: hand_score}
    }
    hash_data = hash_data[0]
    hash_data = hash_data.sort_by do |hash|
      [hash[:hand_score], hash[:hand_power]]
    end
    total = 0
    hash_data.each_with_index {|v, i|
      i += 1
      total += v[:bid] * i
    }
    total
  end

  def solve_part_one_samples
    part_one(SAMPLES_FILENAME)
  end
  
  def solve_part_one_input
    part_one(INPUT_FILENAME)
  end

  # Part 2
  def part_two(file)
    file_data = File.read(file)
    # J est désormais le Joker, et la carte la moins "puissante"
    card_power = ["J", "2", "3", "4", "5", "6", "7", "8", "9", "T", "Q", "K", "A"]
    hash_data = []
    hash_data << file_data.split("\n").map{ |a| 
      a = a.split
      hand_power = a[0].chars.map { |char| (65 + card_power.index(char)).chr }.join
      hand_score =  a[0].split('').tally.sort_by{|k, v| v}.reverse
      hand_score.each_with_index do |v, i|
        if v[0] == "J"
          if i == 0
            unless hand_score[i+1].nil?
              hand_score[1][1] += v[1]
              hand_score[0][1] = 0
            end
          else
            hand_score[0][1] += v[1]
            hand_score[i][1] = 0
          end
        end
      end
      hand_score = hand_score.sort_by{|k, v| v}.reverse.map{_1[1].to_s}.join.ljust(5, '0').to_i
      {hand: a[0], bid: a[1].to_i, hand_power: hand_power, hand_score: hand_score}
    }
    hash_data = hash_data[0]
    hash_data = hash_data.sort_by do |hash|
      [hash[:hand_score], hash[:hand_power]]
    end
    total = 0
    hash_data.each_with_index {|v, i|
      i += 1
      total += v[:bid] * i
    }
    total
  end

  def solve_part_two_samples
    part_two(SAMPLES_FILENAME)
  end
  
  def solve_part_two_input
    part_two(INPUT_FILENAME)
  end

end
