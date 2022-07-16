class MainController < ApplicationController

    def index
        @projects = ProjectService.all
    end

end
