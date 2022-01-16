class Triangle
  def initialize(sides)
    @sides = sides.sort
  end

  def equilateral?
    a = @sides[0]
    b = @sides[1]
    c = @sides[2]
    return false if a.zero? || b.zero? || c.zero?

    a == b && a == c
  end

  def isosceles?
    a = @sides[0]
    b = @sides[1]
    c = @sides[2]
    triangle_inequality?(a, b, c)
  end

  def scalene?
    a = @sides[0]
    b = @sides[1]
    c = @sides[2]
    (a != b && a != c && b != c) &&
      @sides[0..1].sum >= @sides[2]
  end

  def triangle_inequality?(side_a, side_b, side_c)
    (side_a == side_b && side_a + side_b >= side_c) ||
      (side_a == side_c && side_a + side_c >= side_b) ||
      (side_b == side_c && side_b + side_c >= side_a)
  end
end
