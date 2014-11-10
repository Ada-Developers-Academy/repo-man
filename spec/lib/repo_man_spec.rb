require "./lib/repo_man"

describe RepoMan do
  let(:repo_man) { RepoMan.new("Cooks", "Bookis") }
  let(:repo_options) { {organization: "Ada-Projects", auto_init: true} }
  describe '#save' do
    it 'requests to github' do
      expect(Octokit).to receive(:create_repository).with("Cooks-Bookis", repo_options)
      repo_man.save
    end
  end

  describe '.create' do
    it 'calls save on a new instance' do
      expect(RepoMan).to receive(:new).with("Cooks", "Bookis").and_return(repo_man)
      expect(repo_man).to receive(:save)
      RepoMan.create("Cooks", "Bookis")
    end
  end
end
