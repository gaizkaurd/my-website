class ProyectsController < ApplicationController
  before_action :set_proyect, only: %i[ show edit update destroy ]

  # GET /proyects
  def index
    @proyects = Proyect.all
  end

  # GET /proyects/1
  def show
  end

  # GET /proyects/new
  def new
    @proyect = Proyect.new
  end

  # GET /proyects/1/edit
  def edit
  end

  # POST /proyects
  def create
    @proyect = Proyect.new(proyect_params)

    if @proyect.save
      redirect_to @proyect, notice: t('proyects_create_success')
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /proyects/1
  def update
    if @proyect.update(proyect_params)
      redirect_to @proyect, notice: t('proyects_update_success')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /proyects/1
  def destroy
    @proyect.destroy!
    redirect_to proyects_url, notice: t('proyects_destroy_success')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proyect
      @proyect = Proyect.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def proyect_params
      params.require(:proyect).permit(:name, :description, :content, :repo, :start_time, :end_time, :active)
    end
end
