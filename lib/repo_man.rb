require "faker"
require "octokit"

module RepoMan;end

require_relative "repo_man/repo"
require_relative "repo_man/project"
require_relative "repo_man/student"

Octokit.configure do |c|
  c.access_token = ENV["OCTOKIT_GITHUB_TOKEN"]
end
