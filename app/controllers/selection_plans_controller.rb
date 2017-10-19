class SelectionPlansController < ApplicationController
  before_action :set_selection_plan, only: %i[show update destroy]

  # GET /selection_plans
  # GET /selection_plans.json
  def index
    @selection_plans = SelectionPlan.all
  end

  # GET /selection_plans/1
  # GET /selection_plans/1.json
  def show; end

  # POST /selection_plans
  # POST /selection_plans.json
  def create
    @selection_plan = SelectionPlan.new(selection_plan_params)

    if @selection_plan.save
      render :show, status: :created, location: @selection_plan
    else
      render json: @selection_plan.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /selection_plans/1
  # PATCH/PUT /selection_plans/1.json
  def update
    if @selection_plan.update(selection_plan_params)
      render :show, status: :ok, location: @selection_plan
    else
      render json: @selection_plan.errors, status: :unprocessable_entity
    end
  end

  # DELETE /selection_plans/1
  # DELETE /selection_plans/1.json
  def destroy
    @selection_plan.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_selection_plan
    @selection_plan = SelectionPlan.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def selection_plan_params
    params.require(:selection_plan).permit(:plan_id, :selection_id)
  end
end
