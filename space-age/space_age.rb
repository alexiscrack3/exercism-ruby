module Planets
  MERCURY = 0.2408467
  VENUS = 0.61519726
  EARTH = 1
  MARS = 1.8808158
  JUPITER = 11.862615
  SATURN = 29.447498
  URANUS = 84.016846
  NEPTUNE = 164.79132
end

class SpaceAge
  EARTH_DAYS = 365.25

  def initialize(age_in_seconds)
    @age_in_seconds = age_in_seconds
  end

  def on_mercury
    on_planet(Planets::MERCURY)
  end

  def on_venus
    on_planet(Planets::VENUS)
  end

  def on_earth
    on_planet(Planets::EARTH)
  end

  def on_mars
    on_planet(Planets::MARS)
  end

  def on_jupiter
    on_planet(Planets::JUPITER)
  end

  def on_saturn
    on_planet(Planets::SATURN)
  end

  def on_uranus
    on_planet(Planets::URANUS)
  end

  def on_neptune
    on_planet(Planets::NEPTUNE)
  end

  def on_planet(planet)
    @age_in_seconds / seconds(days(planet))
  end

  def days(period)
    period * EARTH_DAYS
  end

  def seconds(days)
    60 * 60 * 24 * days
  end
end
