require 'faraday'
require 'json'

class GithubProfileInfo

  attr_reader :readme, :repositories, :activity, :updated_at, :username, :languages, :about_me

  def initialize(username)
    @username = username
    update!
  end

  def update!
    fetch_repositories
    fetch_activity
    fetch_readme
    fetch_aboutme
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
    @readme = parse_response(response)
  end

  def fetch_aboutme
    begin
    response = Faraday.get("https://raw.githubusercontent.com/#{@username}/#{@username}/main/ABOUT.MD")
    rescue StandardError
        @about_me = 'Error' if @about_me.nil?
        return
    end
    @about_me = parse_response(response)
  end

  def parse_response(response)
    if response.status == 200
        renderer = Redcarpet::Render::HTML
        markdown = Redcarpet::Markdown.new(renderer)
        markdown.render(response.body.to_s)
    else
      'Error'
    end
  end


  def fetch_repositories
    @repositories = Github.repos.list user: @username
  rescue StandardError
    @repositories =  'Error' if @repositories.nil?
  end


end