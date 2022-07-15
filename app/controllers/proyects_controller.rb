class ProyectsController < ApplicationController
  before_action :set_proyect, only: %i[ show ]

  # GET /proyects
  def index
    @proyects = ProjectService.all
  end

  # GET /proyects/1
  def show
  end


  private
    def set_proyect
      @proyect = ProyectService.find(params[:id])
    end

end
