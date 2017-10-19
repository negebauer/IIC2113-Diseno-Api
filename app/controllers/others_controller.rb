class OthersController < ApplicationController
  before_action :set_other, only: %i[show update destroy]

  # GET /others
  # GET /others.json
  def index
    @others = Other.all
  end

  # GET /others/1
  # GET /others/1.json
  def show; end

  # POST /others
  # POST /others.json
  def create
    @other = Other.new(other_params)

    if @other.save
      render :show, status: :created, location: @other
    else
      render json: @other.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /others/1
  # PATCH/PUT /others/1.json
  def update
    if @other.update(other_params)
      render :show, status: :ok, location: @other
    else
      render json: @other.errors, status: :unprocessable_entity
    end
  end

  # DELETE /others/1
  # DELETE /others/1.json
  def destroy
    @other.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_other
    @other = Other.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def other_params
    params.require(:other).permit(:item, :how, :plan_id)
  end
end
