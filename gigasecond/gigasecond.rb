class Gigasecond
  GIGASECONDS = 1_000_000_000
  def self.from(time)
    time + GIGASECONDS
    # time + 1e9
  end
end
