class Sieve
  def initialize(limit)
    @limit = limit
  end

  def primes
    (2..@limit).select { |n| factors(n) <= 2 }
  end

  def factors(number)
    (1..@limit).count { |n| (number % n).zero? }
  end
end
