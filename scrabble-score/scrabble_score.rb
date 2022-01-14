class Scrabble
  POINTS = {
    "1": %w[A E I O U L N R S T],
    "2": %w[D G],
    "3": %w[B C M P],
    "4": %w[F H V W Y],
    "5": ['K'],
    "8": %w[J X],
    "10": %w[Q Z]
  }.freeze

  attr_reader :score

  def initialize(input)
    @score = Scrabble.calculate(input)
  end

  def self.score(input)
    calculate(input)
  end

  def self.calculate(input)
    return 0 if input.nil? || input.strip.empty?

    letters = input.upcase.split('')

    points = 0
    POINTS.each do |key, value|
      points += key.to_s.to_i * letters.count { |letter| value.include?(letter) }
    end
    points
  end
end
