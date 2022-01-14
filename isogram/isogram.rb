require 'set'

class Isogram
  def self.isogram?(input)
    input_arr = input.downcase.scan(/\w/)
    input_arr.length == input_arr.to_set.length
  end
end
