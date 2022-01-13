class HighScores
  def initialize(scores)
    @scores = scores
  end

  def latest
    @scores.last
  end

  def personal_best
    @scores.max
  end

  def personal_top_three
    @scores.max(3) { |a, b| a <=> b }
    # scores.sort.reverse.first(3)
    # scores.sort { |x,y| y <=> x }.first([3, scores.length].min)
  end

  def latest_is_personal_best?
    personal_best == latest
  end

  attr_reader :scores
end
