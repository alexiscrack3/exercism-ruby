class Series
  def initialize(digits)
    @digits = digits
  end

  def slices(number_of_slices)
    raise ArgumentError if number_of_slices > @digits.length

    slices = []
    index = 0
    while (index + number_of_slices - 1) < @digits.length
      slice = @digits[index..index + number_of_slices - 1].to_s
      slices.push(slice)
      index += 1
    end
    slices
    # nums.each_char.each_cons(slice).map(&:join)
  end
end
