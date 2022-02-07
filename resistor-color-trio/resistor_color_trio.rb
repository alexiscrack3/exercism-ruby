class ResistorColorTrio
  COLORS = {
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
  }.freeze

  def initialize(colors)
    @colors = colors
  end

  def label
    raise ArgumentError unless @colors.all? { |c| COLORS.keys.include?(c.to_sym) }

    decoded_values = @colors[0..1].map { |color| COLORS[color.to_sym].to_s }.join
    decoded_zeros = COLORS[@colors[2].to_sym].times.map { |_| '0' }.join
    value = (decoded_values + decoded_zeros).to_i

    "Resistor value: #{resistor_value(value)} #{suffix(value)}"
  end

  private

  def resistor_value(value)
    if value % 1000 == 0
      value / 1000
    else
      value
    end
  end

  def suffix(value)
    if value % 1000 == 0
      'kiloohms'
    else
      'ohms'
    end
  end
end
