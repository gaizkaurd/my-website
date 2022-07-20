class Readme::Component < ViewComponent::Base
  def initialize(username:, readme_html:, file: 'README')
    super
    @username = username
    @readme_html = readme_html
    @file = file
  end

  attr_reader :username, :readme_html, :file
end
