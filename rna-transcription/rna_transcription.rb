class Complement
  TRANSCRIPTION = {
    'G': 'C',
    'C': 'G',
    'T': 'A',
    'A': 'U'
  }.freeze

  def self.of_dna(dna)
    return '' if dna.empty?

    dna.split('').map do |char|
      TRANSCRIPTION[char.to_sym]
    end.join
  end
end
