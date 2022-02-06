class ArmstrongNumbers
  def self.include?(number)
    text = number.to_s
    text.split('').map { |digit| digit.to_i.pow(text.size) }.sum == number
    # number.digits.sum { |n| n ** number.digits.size } == number
  end
end
