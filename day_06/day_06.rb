module Day_06
  require 'benchmark'

  SAMPLES_FILENAME  = "day_06/day_06_samples.txt"
  INPUT_FILENAME    = "day_06/day_06_input.txt"

  module_function

  # First quick solution, not optimized at all but still runs fast (0.000317s)
  def part_one
    bench = Benchmark.measure {
      input = File.read(INPUT_FILENAME).split("\n")
      times = input[0].split[1..]
      distances = input[1].split[1..]
      travels_won = []
      times.length.times do |i|
        time = times[i].to_i
        sub_time = 0
        distance = distances[i].to_i
        travel_done = []
        (1..time-1).each do |t|
          time -= 1
          sub_time += 1
          travel_done << time * sub_time
        end
        travels_won << travel_done.filter{_1>distance}
      end
      travels_won = travels_won.map{_1.count}.reduce(:*)
      puts "Part 1 result : #{travels_won}"
    }
    puts "Exec time : #{bench.real}"
  end

  # First quick solution, not optimized at all (runs in 6.5691s)
  def part_two
    bench = Benchmark.measure {
      input = File.read(INPUT_FILENAME).split("\n")
      time = (input[0].split[1..]*'').to_i
      distance = (input[1].split[1..]*'').to_i
      travels_won = []
      sub_time = 0
      travel_done = []
      (1..time-1).each do |t|
        time -= 1
        sub_time += 1
        travel_done << time * sub_time
      end
      travels_won << travel_done.filter{_1 > distance}
      travels_won = travels_won.map{_1.count}.reduce(:*)
      puts "Part 2 result : #{travels_won}"
    }
    puts "Exec time : #{bench.real}"
  end

  # 2nd solution, went from 6.5691s to 0.8999s
  def part_two_2nd_solution
    bench = Benchmark.measure {
      input = File.read(INPUT_FILENAME).split("\n")
      time = (input[0].split[1..]*'').to_i
      distance = (input[1].split[1..]*'').to_i
      sub_time = 0
      travel_done = []
      (1..time-1).each do |t|
        time -= 1
        if t * time > distance
          travel_done << t
          break
        end
      end
      time = (input[0].split[1..]*'').to_i
      r = time-1..1
      (r.first).downto(r.last).each do |t|
        sub_time += 1
        if t * sub_time > distance
          travel_done <<  t
          break
        end
      end
      puts "Part 2 result : #{(travel_done[0]..travel_done[1]).size}"
    }
    puts "Exec time : #{bench.real}"
  end
end
