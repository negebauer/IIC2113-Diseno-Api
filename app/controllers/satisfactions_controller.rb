class SatisfactionsController < ApplicationController
  before_action :set_satisfaction, only: %i[show update destroy]

  # GET /satisfactions
  # GET /satisfactions.json
  def index
    @satisfactions = Satisfaction.all
  end

  # GET /satisfactions/1
  # GET /satisfactions/1.json
  def show; end

  # POST /satisfactions
  # POST /satisfactions.json
  def create
    @satisfaction = Satisfaction.new(satisfaction_params)

    if @satisfaction.save
      render :show, status: :created, location: @satisfaction
    else
      render json: @satisfaction.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /satisfactions/1
  # PATCH/PUT /satisfactions/1.json
  def update
    if @satisfaction.update(satisfaction_params)
      render :show, status: :ok, location: @satisfaction
    else
      render json: @satisfaction.errors, status: :unprocessable_entity
    end
  end

  # DELETE /satisfactions/1
  # DELETE /satisfactions/1.json
  def destroy
    @satisfaction.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_satisfaction
    @satisfaction = Satisfaction.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def satisfaction_params
    params.require(:satisfaction).permit(:evaluation_id)
  end
end
