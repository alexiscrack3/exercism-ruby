class Scoreboard
  attr_reader :teams

  def initialize(matches)
    @table = calculate_table(matches)
    @teams = calculate_teams(@table)
  end

  def calculate_table(matches)
    table = {}
    matches.each do |match|
      if match.draw?
        add_draw(table, match.team_a)
        add_draw(table, match.team_b)
      else
        add_winner(table, match.winner)
        add_loser(table, match.loser)
      end
    end
    table
  end

  def add_draw(table, team)
    if table.key?(team)
      scores = table[team]
      scores[0] += 1
      scores[2] += 1
    else
      table[team] = [1, 0, 1, 0]
    end
  end

  def add_winner(table, team)
    if table.key?(team)
      scores = table[team]
      scores[0] += 1
      scores[1] += 1
    else
      table[team] = [1, 1, 0, 0]
    end
  end

  def add_loser(table, team)
    if table.key?(team)
      scores = table[team]
      scores[0] += 1
      scores[3] += 1
    else
      table[team] = [1, 0, 0, 1]
    end
  end

  def calculate_teams(table)
    teams = []
    table.each do |team_key, scores|
      teams << Team.new(team_key, scores)
    end
    teams.sort_by { |team| [-team.points, team.name] }
  end
end

class Team
  def initialize(team, scores)
    @team = team
    @scores = scores
  end

  def name
    @team
  end

  def matches_played
    @scores[0]
  end

  def wins
    @scores[1]
  end

  def draws
    @scores[2]
  end

  def losses
    @scores[3]
  end

  def points
    wins * 3 + draws * 1
  end
end

class Match
  attr_reader :team_a, :team_b

  def initialize(team_a, team_b, result)
    @team_a = team_a
    @team_b = team_b
    @result = result
  end

  def winner
    case @result
    when 'win'
      @team_a
    when 'loss'
      @team_b
    end
  end

  def loser
    case @result
    when 'loss'
      @team_a
    when 'win'
      @team_b
    end
  end

  def draw?
    @result == 'draw'
  end
end

class Tournament
  def self.tally(input)
    return header_row if input == "\n"

    matches = matches(input)
    scoreboard = Scoreboard.new(matches)
    team_rows = team_rows(scoreboard.teams)
    header_row + team_rows
  end

  def self.matches(input)
    rows = input.split("\n")
    rows.map do |row|
      record = row.split(';')
      Match.new(record[0], record[1], record[2])
    end
  end

  def self.header_row
    "Team                           | MP |  W |  D |  L |  P\n"
  end

  def self.team_rows(teams)
    teams.reduce('') { |acc, team| acc + team_row(team) }
  end

  def self.team_row(team)
    whitespaces_count = 31 - team.name.length
    team.name + (' ' * whitespaces_count) + "|  #{team.matches_played} |  #{team.wins} |  #{team.draws} |  #{team.losses} |  #{team.points}\n"
  end
end
