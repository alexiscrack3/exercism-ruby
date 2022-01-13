class LogLineParser
  def initialize(line)
    @line = line
  end

  def message
    @line.scan(/:\s(.+)/).first.first.strip
  end

  def log_level
    @line.scan(/\[(.*?)\]/).first.first.downcase
  end

  def reformat
    level = log_level
    @line.scan(/:\s(.+)/).first.first.strip + " (#{level})"
  end
end
