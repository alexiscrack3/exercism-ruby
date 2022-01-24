# Loop through the a range of number, starting from 1 to the given number
# create an array to store numbers that are multiple of 3 or 5
# sum all the numbers
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
