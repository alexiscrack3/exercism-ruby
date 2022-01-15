class ResistorColor
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
  COLORS = RESISTOR_COLORS.keys.map(&:to_s)
  def self.color_code(color)
    RESISTOR_COLORS[color.to_sym].to_i
  end
end
