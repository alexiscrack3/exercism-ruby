class Triplet
  def initialize(*digits)
    @digits = digits
  end

  def sum
    @digits.sum
  end

  def product
    @digits.reduce { |sum, num| sum * num }
    # @digits.reduce(:*)
  end

  def pythagorean?
    @digits[0..1].map { |n| n.pow(2) }.sum == @digits.last.pow(2)
  end

  def self.where(factors)
    triplets = []
    sum = factors.fetch(:sum, nil)
    min_factor = factors.fetch(:min_factor, 0)
    max_factor = factors.fetch(:max_factor, 0)
    (min_factor..max_factor).each do |i|
      (i + 1..max_factor).each do |j|
        (j + 1..max_factor).each do |k|
          triplet = Triplet.new(i, j, k)
          triplets << triplet if triplet.pythagorean? && (sum.nil? || triplet.sum == sum)
        end
      end
    end
    triplets
  end
end
