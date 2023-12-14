require_relative "../../src/day_09/day_09"

RSpec.describe Day_09 do
  it "test part_one with samples" do
    expect(Day_09.solve_part_one_samples).to eq(68)
  end

  it "test part_two with samples" do
    expect(Day_09.solve_part_two_samples).to eq(5)
  end

  it "test part_one with input" do
    expect(Day_09.solve_part_one_input).to eq(1995001648)
  end

  it "test part_two with input" do
    expect(Day_09.solve_part_two_input).to eq(988)
  end
end
