class ImplementsController < ApplicationController
  before_action :set_implement, only: %i[show update destroy]

  # GET /implements
  # GET /implements.json
  def index
    @implements = Implement.all
  end

  # GET /implements/1
  # GET /implements/1.json
  def show; end

  # POST /implements
  # POST /implements.json
  def create
    @implement = Implement.new(implement_params)

    if @implement.save
      render :show, status: :created, location: @implement
    else
      render json: @implement.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /implements/1
  # PATCH/PUT /implements/1.json
  def update
    if @implement.update(implement_params)
      render :show, status: :ok, location: @implement
    else
      render json: @implement.errors, status: :unprocessable_entity
    end
  end

  # DELETE /implements/1
  # DELETE /implements/1.json
  def destroy
    @implement.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_implement
    @implement = Implement.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def implement_params
    params.require(:implement).permit(:plan_id)
  end
end
