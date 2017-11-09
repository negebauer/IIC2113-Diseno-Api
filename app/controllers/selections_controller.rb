class SelectionsController < ApplicationController
  before_action :require_login
  before_action :set_experience, only: %i[index create update]
  before_action :set_selection, only: %i[show update destroy]

  def index
    @methods = @experience.methoods.distinct
    render json: @methods, status: :ok,
           except: %i[created_at updated_at video description]
  end

  def show
    render json: @selection, status: :ok
  end

  def create
    @selection = Selection.new(selection_params)
    if @experience.users.include?(current_user) && @selection.save
      render :show, status: :created,
                    location: experience_selection_path(@experience, @selection)
    else
      render json: @selection.errors, status: :unprocessable_entity
    end
  end

  def update
    if @selection.update(update_selection_params)
      render :show, status: :ok,
                    location: experience_selection_path(@experience, @selection)
    else
      render json: @selection.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @selection && @selection.destroy
      render json: { message: 'Selection deleted successfully' }, status: :ok
    else
      render json: { message: 'Could not delete Selection' },
             status: :not_acceptable
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_experience
    @experience = Experience.find_by(id: params[:experience_id])
  end

  def set_selection
    @selection = Selection.find_by(id: params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def selection_params
    params.require(:selection).permit(:applicable, :usefulness, :relevance,
                                      :feasibility, :methood_id)
          .merge(experience_id: @experience.id)
  end

  def update_selection_params
    params.require(:selection).permit(:applicable, :usefulness, :relevance,
                                      :feasibility)
  end
end
