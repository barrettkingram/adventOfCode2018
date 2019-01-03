class Day2
  def self.part1(input)
    two_count = 0
    three_count = 0
    input.split.each do |id|
      values = id.chars.inject(Hash.new(0)) { |counts, char| counts.tap { |h| h[char] += 1 } }.values
      two_count += 1 if values.include? 2
      three_count += 1 if values.include? 3
    end
    puts two_count * three_count
  end

  def self.part2(input)
    ids = input.split
    match = nil
    i = 0

    loop do
      id1 = ids[i]
      ids[1..-1].each do |id2|
        off_count = 0
        matched = true

        id1.chars.each_with_index do |id1_char, j|
          off_count += 1 if id1_char != id2[j]
          if off_count > 1
            matched = false
            break
          end
        end

        if matched
          match = [id1, id2]
          break
        end
      end

      if match
        result = []
        match[0].chars.each_with_index { |x, k| result << x if match[1].chars[k] == x }
        puts result.inject(&:+)
        break
      end

      i += 1
    end
  end
end
