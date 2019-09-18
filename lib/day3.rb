class Claim
  attr_reader :id, :left_edge, :top_edge, :width, :height

  def initialize(string)
    @id, @left_edge, @top_edge, @width, @height = string.scan(/\A#(\d+) @ (\d+),(\d+): (\d+)x(\d+)/).flatten.map(&:to_i)
  end
end

class Fabric
  def initialize(input)
    @claims = build_claims(input)
    @claims_matrix = build_claims_matrix
  end

  def count_overlapping_inches
    @claims_matrix.flatten.compact.count { |val| val > 1 }
  end

  def find_non_overlapping_claim
    @claims.find { |claim|
      @claims_matrix[claim.left_edge..(claim.left_edge + claim.width - 1)].all? { |row|
        row[claim.top_edge..(claim.top_edge + claim.height - 1)].all? { |value| value == 1 }
      }
    }.id
  end

  private

  def build_claims(input)
    input.split("\n").map { |claim_string| Claim.new(claim_string) }
  end

  def build_claims_matrix
    matrix = []
    @claims.each do |claim|
      (claim.left_edge..(claim.left_edge + claim.width - 1)).each do |x|
        matrix[x] = [] if matrix[x].nil?
        (claim.top_edge..(claim.top_edge + claim.height - 1)).each do |y|
          matrix[x][y] = 0 if matrix[x][y].nil?
          matrix[x][y] += 1
        end
      end
    end
    matrix
  end
end

class Day3
  def self.part1(input)
    fabric = Fabric.new(input)
    fabric.count_overlapping_inches
  end

  def self.part2(input)
    fabric = Fabric.new(input)
    fabric.find_non_overlapping_claim
  end
end
