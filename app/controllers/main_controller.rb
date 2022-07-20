class MainController < ApplicationController

    def index
        @projects = ProjectService.all
    end

    def about
    end

end
