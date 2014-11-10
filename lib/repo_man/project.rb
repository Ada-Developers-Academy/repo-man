class RepoMan::Project

  def initialize(name, options={})
    @name      = name
    @team_size = options[:team_size] || 1
  end

  def teams
    @teams ||= create_teams
  end

  def create_teams
    RepoMan::Student.all.each_slice(@team_size).map { |team| self.team_name(team) }
  end

  def team_name(team=[])
    if team.size == 1
      team.first
    else
      Faker::Commerce.color
    end
  end
end
