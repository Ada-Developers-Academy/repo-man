require "octokit"
class RepoMan::Repo
  REPO_OPTIONS = {organization: "Ada-Projects", auto_init: true}

  def initialize(project_name, student_name)
    @project_name = project_name
    @student_name = student_name
  end

  def repo_name
    "#{@project_name}-#{@student_name}"
  end

  def save
    Octokit.create_repository repo_name, REPO_OPTIONS
  end

  def self.create(*args)
    self.new(*args).save
  end

end
