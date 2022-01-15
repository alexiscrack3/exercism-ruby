class CollatzConjecture
  def self.steps(n)
    raise ArgumentError if n.zero? || n.negative?

    counter = 0
    while n > 1
      if n.even?
        n /= 2
      else
        n = n * 3 + 1
      end
      counter += 1
    end
    counter
  end
end
