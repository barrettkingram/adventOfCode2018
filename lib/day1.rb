class Day1
  def self.part1(input)
    input.split.inject(0) { |s, x| s + x.to_i }
  end

  def self.part2(input)
    nums = input.split
    catch(:result) do
      freqs, start = {}, 0
      loop do
        start = nums.inject(start) { |sum, x|
          throw :result, sum if freqs.key?(sum.to_s)
          freqs[sum.to_s] = sum + x.to_i
        }
      end
    end
  end
end
