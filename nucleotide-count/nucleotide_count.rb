class Nucleotide
  VALID_CHARACTERS = %w[A T C G].freeze

  def self.from_dna(characters)
    raise ArgumentError unless characters.split('').all? { |c| VALID_CHARACTERS.include?(c) }

    Nucleotide.new(characters)
  end

  def initialize(characters)
    hash = VALID_CHARACTERS.each_with_object({}) { |word, acc| acc[word] = 0 }
    @hash = characters.chars.each_with_object(hash) { |word, acc| acc[word] += 1 }
  end

  def count(character)
    @hash[character]
  end

  def histogram
    @hash
  end
end
