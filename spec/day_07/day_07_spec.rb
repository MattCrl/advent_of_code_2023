require_relative "../../src/day_07/day_07"

RSpec.describe Day_07 do
  it "test part_one with samples" do
    expect(Day_07.solve_part_one_samples).to eq(6440)
  end

  it "test part_two with samples" do
    expect(Day_07.solve_part_two_samples).to eq(5905)
  end

  it "test part_one with input" do
    expect(Day_07.solve_part_one_input).to eq(250370104)
  end

  it "test part_two with input" do
    expect(Day_07.solve_part_two_input).to eq(251735672)
  end
end
