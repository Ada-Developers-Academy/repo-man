require "./lib/repo_man"

describe RepoMan do
  let(:repo_man) { RepoMan.new("Cooks", "Bookis") }
  let(:repo_options) { {organization: "Ada-Projects", auto_init: true} }
  describe '#create' do
    it 'requests to github' do
      expect(Octokit).to receive(:create_repository).with("Cooks-Bookis", repo_options)
      repo_man.create
    end
  end
end
