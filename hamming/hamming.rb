class Hamming
  def self.compute(sequence_one, sequence_two)
    raise ArgumentError if sequence_one.length != sequence_two.length

    # arr_one = sequence_one.split('')
    # arr_two = sequence_two.split('')
    # counter = 0
    # arr_one.each_with_index do |value, i|
    #   counter += 1 if value != arr_two[i]
    # end
    # counter
    (0...sequence_one.size).count { |i| sequence_one[i] != sequence_two[i] }
  end
end
