class PlansController < ApplicationController
  before_action :set_experience
  before_action :set_plan, only: %i[show update destroy]
  before_action :require_login

  # GET /plans/1
  # GET /plans/1.json
  def show
    render :show, status: :created, location: experience_plan_url(@experience)
  end

  # POST /plans
  # POST /plans.json
  def create
    if @experience.plan
      render json: { error: 'Already has a plan' }, status: :unprocessable_entity
      return
    end
    @plan = Plan.new(plan_params)
    @plan.experience = @experience

    if @plan.save
      render :show, status: :created, location: experience_plan_url(@experience)
    else
      render json: @plan.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /plans/1
  # PATCH/PUT /plans/1.json
  def update
    if @plan.update(plan_params)
      render :show, status: :ok, location: experience_plan_url(@experience)
    else
      render json: @plan.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_experience
    @experience = Experience.find(params[:experience_id])
  end

  def set_plan
    @plan = @experience.plan
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def plan_params
    params.require(:plan).permit(
      selection_plans_attributes: %i[id _destroy reasons selection_id],
      goals_attributes: %i[id _destroy name when how description],
      resources_attributes: %i[id _destroy name how available],
      diffusion_attributes: %i[id
                               audience_before audience_during audience_after
                               channel_before channel_during channel_after
                               objective_before objective_during objective_after]
    )
  end
end
