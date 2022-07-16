class Project

    attr_accessor :name, :description, :short_description, :author, :repository, :copyright, :start_time, :end_time, 
:time_to_read, :id

    def initialize(path, id)
        load_files!(path)
        @id = id
    end

    def load_files!(path)
        File.open(File.join(path, 'data.json')) do |file|
            parse_data!(file.read)
        end

        File.open(File.join(path, 'description.md')) do |file|
            parse_description!(file.read)
        end
    end

    def parse_description!(raw_description)
        @time_to_read = raw_description.split.length
        renderer = Redcarpet::Render::HTML
        markdown = Redcarpet::Markdown.new(renderer)
        @description = markdown.render(raw_description)
    end

    def parse_data!(raw_json)
        json_data = JSON.parse(raw_json)
        @name = json_data['name']
        @author = json_data['author']
        @short_description = json_data['description']
        @repository = json_data['repository']
        @copyright = json_data['copyright']
        @start_time = json_data['start-time']
        @end_time = json_data['end-time']
    end
    
end