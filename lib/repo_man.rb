require "octokit"
class RepoMan
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

end
