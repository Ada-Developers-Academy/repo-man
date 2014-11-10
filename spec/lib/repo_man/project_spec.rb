require "./lib/repo_man"

describe RepoMan::Project do

  describe '#team_name' do
    it 'returns the student name dasherized when team size of one' do
      RepoMan::Project.new("Cooks", team_size: 1).team_name
    end
  end
  describe '#teams' do
    it 'returns an array with a size of team_size/total' do
      project = RepoMan::Project.new("Cooks", team_size: 1)
      expect(RepoMan::Student).to receive(:all).and_return(["Kermit the Frog", "Grover", "Gonzo", "Beaker"])
      expect(project.teams.size).to eq 4
    end

    context 'when given a team size greater than one' do
      it 'returns an array with a size of team_size/total' do
        project = RepoMan::Project.new("Cooks", team_size: 2)
        expect(RepoMan::Student).to receive(:all).and_return(["Kermit the Frog", "Grover", "Gonzo", "Beaker"])
        expect(project.teams.size).to eq 2
      end

      it 'a team string is not a student name' do
        project = RepoMan::Project.new("Cooks", team_size: 2)
        expect(RepoMan::Student).to receive(:all).and_return(["Kermit the Frog", "Grover", "Gonzo", "Beaker"])
        expect(project).to receive(:team_name).twice.and_return("Muppets", "Science")
        expect(project.teams.first).to eq "Muppets"
      end
    end
  end
  context 'when given teams of one' do
    let(:project) { RepoMan::Project.new("Cooks", team_size: 1) }
    it 'assigns the project name to the student name' do
      project.teams
    end
  end
end
