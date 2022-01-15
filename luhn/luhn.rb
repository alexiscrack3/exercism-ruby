class Luhn
  MAX_DIGIT = 9
  def self.valid?(digits)
    values = digits.reverse.gsub(/\s+/, '').split('')
    return false if values.size <= 1 || values.any? { |d| d.match(/\D/) }

    all_digits = values.map(&:to_i)
    sum = all_digits
          .each_with_index
          .map do |d, i|
            if i.odd?
              double_digit(d)
            else
              d
            end
          end
          .reduce(0) { |acc, d| acc + d }
    (sum % 10).zero?
  end

  def self.double_digit(digit)
    doubled_digit = digit * 2
    if doubled_digit < MAX_DIGIT
      doubled_digit
    else
      doubled_digit - MAX_DIGIT
    end
  end
end
