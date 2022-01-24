class SumOfMultiples
  def initialize(*divisors)
    @divisors = divisors
  end

  def to(number)
    arr = []
    (1..number).each do |n|
      arr << n if divisible?(n, @divisors) && number != n
    end
    arr.sum
  end

  def divisible?(dividend, divisors)
    return false if divisors.any?(0)

    divisors.any? { |d| (dividend % d).zero? }
  end
end
