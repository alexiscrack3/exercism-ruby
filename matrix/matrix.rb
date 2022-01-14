class Matrix
  def initialize(raw_grid)
    elements = raw_grid.split("\n")
    @grid = []
    (0..elements.size - 1).each do |i|
      row = elements[i].split(' ').map(&:to_i)
      @grid.push(row)
    end
    @grid
    # @rows = values.split(/\n/).map { |line| line.split(' ').map(&:to_i) }
    # @columns = @rows.transpose
  end

  def rows
    @grid
  end

  def columns
    temp = []
    (0..@grid.length - 1).each do |i|
      cols = @grid.map { |row| row[i] }
      temp[i] = cols
    end
    temp
  end
end
