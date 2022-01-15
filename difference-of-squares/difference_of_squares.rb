class Squares
  def initialize(n)
    @n = n
  end

  def square_of_sum
    (0..@n).sum.pow(2)
  end

  def sum_of_squares
    (0..@n).map { |n| n.pow(2) }.sum
  end

  def difference
    square_of_sum - sum_of_squares
  end
end
