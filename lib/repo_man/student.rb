class RepoMan::Student

  def self.all
    File.readlines("support/students.txt").collect(&:strip)
  end
  
end
