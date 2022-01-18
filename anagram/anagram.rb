class Anagram
  def initialize(word)
    @word = word
  end

  def match(anagrams)
    return [] if anagrams.none? { |anagram| anagram.length == @word.length }

    return [] if anagrams.all? { |anagram| anagram.downcase == @word }

    word = @word.downcase
    anagrams.find_all do |anagram|
      candidate = anagram.downcase
      condition_a = word != candidate
      condition_b = anagram.length == word.length
      condition_c = candidate.split('').sort == word.split('').sort

      condition_a && condition_b && condition_c
    end
  end
end
