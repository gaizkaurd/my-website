class Repository::Component < ViewComponent::Base
  with_collection_parameter :repo
  
  def initialize(repo:, repo_iteration:)
    @repo = repo
    @repo_iteration = repo_iteration
    super
  end

  attr_reader :repo, :repo_iteration

  def render?
    repo.name != 'gaizkaurd'
  end
end
