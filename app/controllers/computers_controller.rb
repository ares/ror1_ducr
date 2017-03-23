class ComputersController < ApplicationController
  before_action :set_computer, only: [:show, :edit, :update, :destroy]

  # GET /computers
  def index
    @computers = Computer.all.order(params[:order]).limit(5).offset(params[:offset])
    if params[:filter]
      @computers = @computers.where("city LIKE '#{params[:filter][:city]}%'")
    end
  end

  # GET /computers/1
  def show
  end

  # GET /computers/new
  def new
    @computer = Computer.new
  end

  def new_import
  end

  def create_import
    log = ""

    text = params[:computer][:data].read
    lines = text.split("\r\n")
    lines.each do |line|
      vendor, cost, city, serial_number = line.split(';')
      computer = Computer.new(:vendor => vendor, :cost => cost, :city => city, :serial_number => serial_number)
      if computer.save
        log += "pocitac #{computer.id} ulozen\n"
      else
        log += "pocitac jsme neulozili, protoze: #{computer.errors.full_messages.join(',')}"
      end
    end

    redirect_to computers_path, :notice => log
  end

  # GET /computers/1/edit
  def edit
  end

  # POST /computers
  def create
    @computer = Computer.new(computer_params)

    if @computer.save
      redirect_to @computer, notice: 'Computer was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /computers/1
  def update
    if @computer.update(computer_params)
      redirect_to @computer, notice: 'Computer was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /computers/1
  def destroy
    @computer.destroy
    redirect_to computers_url, notice: 'Computer was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_computer
      @computer = Computer.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def computer_params
      params.require(:computer).permit(:city, :warranty, :vendor, :serial_number, :cost, :operating_system_id)
    end
end
