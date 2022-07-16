require 'project'


Rails.application.config.x.projects = []

Dir.entries(Rails.root.join('projects')).each_with_index do |file, n|
    if file != '.' && file != '..'
        Rails.application.config.x.projects << Project.new(Rails.root.join('projects', file.to_s), n)
    end
end

Rails.logger.debug { "Projects loaded: #{Rails.application.config.x.projects.size}" }