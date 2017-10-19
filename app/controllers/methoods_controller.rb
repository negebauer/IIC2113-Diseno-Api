class MethoodsController < ApplicationController
  before_action :set_methood, only: %i[show update destroy]

  # GET /methoods
  # GET /methoods.json
  def index
    @methoods = Methood.all
  end

  # GET /methoods/1
  # GET /methoods/1.json
  def show; end

  # POST /methoods
  # POST /methoods.json
  def create
    @methood = Methood.new(methood_params)

    if @methood.save
      render :show, status: :created, location: @methood
    else
      render json: @methood.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /methoods/1
  # PATCH/PUT /methoods/1.json
  def update
    if @methood.update(methood_params)
      render :show, status: :ok, location: @methood
    else
      render json: @methood.errors, status: :unprocessable_entity
    end
  end

  # DELETE /methoods/1
  # DELETE /methoods/1.json
  def destroy
    @methood.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_methood
    @methood = Methood.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def methood_params
    params.require(:methood).permit(:name, :description, :video, :link)
  end
end
