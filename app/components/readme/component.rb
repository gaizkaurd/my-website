class Readme::Component < ViewComponent::Base
  def initialize(username:, readme_html:)
    super
    @username = username
    @readme_html = readme_html
    super
  end

  attr_reader :username, :readme_html
end
