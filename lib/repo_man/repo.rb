class RepoMan::Repo
  REPO_OPTIONS = {organization: "Ada-Projects", auto_init: true}

  def initialize(project_name, team_name)
    @project_name = project_name
    @team_name    = team_name
  end

  def repo_name
    "#{@project_name}-#{@team_name}"
  end

  def repo_path
    "#{org}/#{repo_name}"
  end

  def org
    "Ada-Projects"
  end

  def save
    Octokit.create_repository repo_name, organization: org, auto_init: true
  end

  def self.create(*args)
    self.new(*args).save
  end

  def inspect
    repo_name
  end

end
