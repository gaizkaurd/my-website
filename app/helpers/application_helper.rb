module ApplicationHelper
    def cp(path)
        return true if current_page?(path)
    end

    def truncate(string, max)
        string.length > max ? "#{string[0...max]}..." : string
    end
end
