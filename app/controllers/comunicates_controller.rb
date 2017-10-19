class ComunicatesController < ApplicationController
  before_action :set_comunicate, only: %i[show update destroy]

  # GET /comunicates
  # GET /comunicates.json
  def index
    @comunicates = Comunicate.all
  end

  # GET /comunicates/1
  # GET /comunicates/1.json
  def show; end

  # POST /comunicates
  # POST /comunicates.json
  def create
    @comunicate = Comunicate.new(comunicate_params)

    if @comunicate.save
      render :show, status: :created, location: @comunicate
    else
      render json: @comunicate.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comunicates/1
  # PATCH/PUT /comunicates/1.json
  def update
    if @comunicate.update(comunicate_params)
      render :show, status: :ok, location: @comunicate
    else
      render json: @comunicate.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comunicates/1
  # DELETE /comunicates/1.json
  def destroy
    @comunicate.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_comunicate
    @comunicate = Comunicate.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comunicate_params
    params.require(:comunicate).permit(:evaluation_id)
  end
end
