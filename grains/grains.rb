class Grains
  def self.square(square)
    raise ArgumentError if square.negative? || square.zero? || square > 64

    2.pow(square - 1)
  end

  def self.total
    (1..64).map { |n| square(n) }.sum
  end
end
