class DiffusionsController < ApplicationController
  before_action :set_diffusion, only: %i[show update destroy]

  # GET /diffusions
  # GET /diffusions.json
  def index
    @diffusions = Diffusion.all
  end

  # GET /diffusions/1
  # GET /diffusions/1.json
  def show; end

  # POST /diffusions
  # POST /diffusions.json
  def create
    @diffusion = Diffusion.new(diffusion_params)

    if @diffusion.save
      render :show, status: :created, location: @diffusion
    else
      render json: @diffusion.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /diffusions/1
  # PATCH/PUT /diffusions/1.json
  def update
    if @diffusion.update(diffusion_params)
      render :show, status: :ok, location: @diffusion
    else
      render json: @diffusion.errors, status: :unprocessable_entity
    end
  end

  # DELETE /diffusions/1
  # DELETE /diffusions/1.json
  def destroy
    @diffusion.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_diffusion
    @diffusion = Diffusion.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def diffusion_params
    params.require(:diffusion).permit(:before, :during, :after, :plan_id)
  end
end
