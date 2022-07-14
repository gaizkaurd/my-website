require 'github_profile_info'

Rails.application.config.x.github = GithubProfileInfo.new('gaizkaurd')

task = Concurrent::TimerTask.new(execution_interval: 1200) do 
    Rails.application.config.x.github.update
end

task.execute