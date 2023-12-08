require_relative "../../src/day_03/day_03"
RSpec.describe Day_03 do
  it "test sum_parts_engine_schematic with samples" do
    file_data = Day_03.read_input_file("spec/day_03/day_03_samples_part1.txt")
    expect(Day_03.sum_parts_engine_schematic(file_data)).to eq(4361)
  end

  it "test sum_parts_engine_schematic with final inputs" do
    file_data = Day_03.read_input_file("spec/day_03/day_03_input.txt")
    expect(Day_03.sum_parts_engine_schematic(file_data)).to eq(540212)
  end

  it "test sum_parts_engine_schematic_p2 with samples" do
    file_data = Day_03.read_input_file("spec/day_03/day_03_samples_part2.txt")
    expect(Day_03.sum_parts_engine_schematic_p2(file_data)).to eq(467835)
  end

  it "test sum_parts_engine_schematic_p2 with final inputs" do
    file_data = Day_03.read_input_file("spec/day_03/day_03_input.txt")
    expect(Day_03.sum_parts_engine_schematic_p2(file_data)).to eq(87605697)
  end
end
