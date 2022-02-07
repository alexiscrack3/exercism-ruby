class Matrix
  def initialize(input)
    @grid = build_grid(input)
  end

  def rows
    @grid
  end

  def columns
    @grid.transpose
    # temp = []
    # num_cols = @grid.first.size
    # (0...num_cols).each do |i|
    #   row = []
    #   (0...@grid.size).each do |j|
    #     row << @grid[j][i]
    #   end
    #   temp << row
    # end
    # temp
  end

  def saddle_points
    points = []
    (0...rows.size).each do |i|
      (0...columns.size).each do |j|
        row = rows[i]
        col = columns[j]
        points << [i, j] if greater_than_or_equal_to(row[j], row) && less_than_or_equal_to(col[i], col)
      end
    end
    points
  end

  private

  def greater_than_or_equal_to(value, row)
    row.all? { |v| value >= v }
  end

  def less_than_or_equal_to(value, col)
    col.all? { |v| value <= v }
  end

  def build_grid(input)
    input.split("\n").map { |row| row.split(' ').map(&:to_i) }
  end
end
