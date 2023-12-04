require_relative "../../day_04/day_04"
RSpec.describe Day_04 do
  it "test scratchcards_points_calculator with samples" do
    file_data = Day_04.read_input_file("spec/day_04/day_04_samples.txt")
    expect(Day_04.scratchcards_points_calculator(file_data)).to eq(13)
  end

  it "test scratchcards_points_calculator with final inputs" do
    file_data = Day_04.read_input_file("spec/day_04/day_04_input.txt")
    expect(Day_04.scratchcards_points_calculator(file_data)).to eq(21088)
  end

end
