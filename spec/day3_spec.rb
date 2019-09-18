require "minitest/autorun"
require "day3"

describe Day3 do
  before do
    @input = <<~EOF
      #1 @ 1,3: 4x4
      #2 @ 3,1: 4x4
      #3 @ 5,5: 2x2
    EOF
  end

  describe "part 1" do
    it "gives the correct answer with example input" do
      Day3.part1(@input).must_equal 4
    end
  end

  describe "part 2" do
    it "gives the correct answer with example input" do
      Day3.part2(@input).must_equal 3
    end
  end
end
