require_relative '../../day_01/day_01'

RSpec.describe Day_01 do
  it "test sum_calibration_values with samples" do
    file_data = Day_01.read_input_file("spec/day_01/day_01_samples_part1.txt")
    expect(Day_01.sum_calibration_values(file_data)).to eq(142)
  end

  it "test sum_calibration_values with final inputs" do
    file_data = Day_01.read_input_file("spec/day_01/day_01_input.txt")
    expect(Day_01.sum_calibration_values(file_data)).to eq(54597)
  end

  it "test sum_calibration_values_part2 with samples" do
    file_data = Day_01.read_input_file("spec/day_01/day_01_samples_part2.txt")
    expect(Day_01.sum_calibration_values_part2(file_data)).to eq(281)
  end

  it "test sum_calibration_values_part2 with final inputs" do
    file_data = Day_01.read_input_file("spec/day_01/day_01_input.txt")
    expect(Day_01.sum_calibration_values_part2(file_data)).to eq(54504)
  end
end
