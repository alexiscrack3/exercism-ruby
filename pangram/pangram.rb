class Pangram
  def self.pangram?(sentence)
    return false if sentence.empty?

    sentence_array = sentence.downcase.split('')
    alphabet_array = ('a'..'z').to_a
    alphabet_array.all? { |letter| sentence_array.include?(letter) }
  end
end
