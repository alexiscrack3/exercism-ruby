class Clock
  attr_reader :hour, :minute

  def initialize(hour: 0, minute: 0)
    @hour = hour
    @minute = minute
  end

  def to_s
    total_in_minutes = @hour * 60 + @minute
    hours = total_in_minutes / 60
    adjusted_hours = update_hours(hours)
    minutes = total_in_minutes % 60
    "#{format('%02d', adjusted_hours)}:#{format('%02d', minutes)}"
  end

  def +(other)
    Clock.new(hour: hour + other.hour, minute: minute + other.minute)
  end

  def -(other)
    Clock.new(hour: hour - other.hour, minute: minute - other.minute)
  end

  def ==(other)
    to_s == other.to_s
  end

  def update_hours(hours)
    if hours.positive?
      hours -= 24 while hours >= 24
      hours
    else
      hours += 24 while hours < 0
      hours
    end
  end
end
