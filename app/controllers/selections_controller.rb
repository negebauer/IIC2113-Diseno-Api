class SelectionsController < ApplicationController
  before_action :set_selection, only: %i[show update destroy]

  # GET /selections
  # GET /selections.json
  def index
    @selections = Selection.all
  end

  # GET /selections/1
  # GET /selections/1.json
  def show; end

  # POST /selections
  # POST /selections.json
  def create
    @selection = Selection.new(selection_params)

    if @selection.save
      render :show, status: :created, location: @selection
    else
      render json: @selection.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /selections/1
  # PATCH/PUT /selections/1.json
  def update
    if @selection.update(selection_params)
      render :show, status: :ok, location: @selection
    else
      render json: @selection.errors, status: :unprocessable_entity
    end
  end

  # DELETE /selections/1
  # DELETE /selections/1.json
  def destroy
    @selection.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_selection
    @selection = Selection.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def selection_params
    params.require(:selection).permit(:applicable, :usefulness, :relevance, :feasibility, :experience_id, :methood_id)
  end
end
