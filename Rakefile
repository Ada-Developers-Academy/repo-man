require_relative "lib/repo_man"
task :create_repos do
  project_name = ""
  while project_name == ""
    print "What is the project name: "
    project_name = STDIN.gets.chomp
  end

  team_size = 0
  while team_size == 0
    print "How many people per team: "
    team_size = STDIN.gets.chomp.to_i
  end

  project = RepoMan::Project.new(project_name, team_size: team_size)
  teams = project.teams.map do |team|
    RepoMan::Repo.new(project_name, team)
  end

  puts "You are about to create the following repos:"
  teams.each do |team|
    puts "  " + team.repo_path
  end
  print "Is that ok? [y/N]: "
  make = STDIN.gets.chomp

  if make == "y"
    teams.each do |repo|
      begin
        repo.save
      rescue Octokit::UnprocessableEntity
        puts "Alert: #{repo.repo_path} did not save!"
      end
    end
  end
end
