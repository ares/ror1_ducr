class OperatingSystemsController < ApplicationController
  before_action :set_operating_system, only: [:show, :edit, :update, :destroy]

  # GET /operating_systems
  def index
    @operating_systems = OperatingSystem.all
  end

  # GET /operating_systems/1
  def show
  end

  # GET /operating_systems/new
  def new
    @operating_system = OperatingSystem.new
  end

  # GET /operating_systems/1/edit
  def edit
  end

  # POST /operating_systems
  def create
    @operating_system = OperatingSystem.new(operating_system_params)

    if @operating_system.save
      redirect_to @operating_system, notice: 'Operating system was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /operating_systems/1
  def update
    if @operating_system.update(operating_system_params)
      redirect_to @operating_system, notice: 'Operating system was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /operating_systems/1
  def destroy
    @operating_system.destroy
    redirect_to operating_systems_url, notice: 'Operating system was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_operating_system
      @operating_system = OperatingSystem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def operating_system_params
      params.require(:operating_system).permit(:name)
    end
end
