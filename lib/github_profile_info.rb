require 'faraday'
require 'json'

class GithubProfileInfo

  attr_reader :readme, :repositories, :activity, :updated_at, :username

  def initialize(username)
    @username = username
    update!
  end

  def update!
    fetch_repositories
    fetch_activity
    fetch_readme
    @updated_at = Time.zone.today
  end

  private
  def fetch_activity
    @activity = Github.activity.events.performed(@username)[0...5]
  rescue StandardError
    @activity =  'Error' if @activity.nil?
  end

  def fetch_readme
    begin
    response = Faraday.get("https://raw.githubusercontent.com/#{@username}/#{@username}/main/README.MD")
    rescue StandardError
        @readme = 'Error' if @readme.nil?
        return
    end
    parse_response(response)
  end


  def parse_response(response)
    if response.status == 200
        renderer = Redcarpet::Render::HTML
        markdown = Redcarpet::Markdown.new(renderer)
        @readme = markdown.render(response.body.to_s)
    elsif @readme.nil?
        @readme = 'Error'
end
  end


  def fetch_repositories
    @repositories = Github.repos.list user: @username
  rescue StandardError
    @repositories =  'Error' if @repositories.nil?
  end


end