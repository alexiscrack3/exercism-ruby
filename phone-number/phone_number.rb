class PhoneNumber
  def self.clean(phone)
    digits = phone.scan(/\d/).map(&:to_i)
    return nil if digits.size < 10 || digits.size > 11

    country_code = (digits.shift if digits.size == 11)
    return nil if !country_code.nil? && country_code != 1

    digits.join.to_s if valid?(digits[0]) && valid?(digits[3])
  end

  def self.valid?(digit)
    (2..9).include?(digit)
  end
end
