class ResistorColorDuo
  RESISTOR_COLORS = {
    black: 0,
    brown: 1,
    red: 2,
    orange: 3,
    yellow: 4,
    green: 5,
    blue: 6,
    violet: 7,
    grey: 8,
    white: 9
  }
  def self.value(colors)
    colors.take(2)
          .map { |color| RESISTOR_COLORS[color.to_sym] }
          .join
          .to_i
  end
end
