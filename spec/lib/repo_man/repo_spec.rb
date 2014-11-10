require "./lib/repo_man"

describe RepoMan::Repo do
  let(:repo) { RepoMan::Repo.new("Cooks", "Bookis") }
  let(:repo_options) { {organization: "Ada-Projects", auto_init: true} }
  describe '#save' do
    it 'requests to github' do
      expect(Octokit).to receive(:create_repository).with("Cooks-Bookis", repo_options)
      repo.save
    end
  end

  describe '.create' do
    it 'calls save on a new instance' do
      expect(RepoMan::Repo).to receive(:new).with("Cooks", "Bookis").and_return(repo)
      expect(repo).to receive(:save)
      RepoMan::Repo.create("Cooks", "Bookis")
    end
  end
end
