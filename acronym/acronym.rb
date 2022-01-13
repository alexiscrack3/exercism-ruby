class Acronym
  def self.abbreviate(text)
    text.sub('-', ' ')
        .split(' ')
        .map { |word| word[0].upcase }
        .join('')
    # text.split(/[- ]+/).map(&:chr).join.upcase
  end
end
