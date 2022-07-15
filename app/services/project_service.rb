module ProjectService

    def self.find(id)
        Rails.application.config.x.projects.find { |proyect| proyect.id == id }
    end

    def self.all
        Rails.application.config.x.projects
    end

end