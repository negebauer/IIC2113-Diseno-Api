class ImplementsController < ApplicationController
  before_action :require_login
  before_action :set_implement, only: %i[show update destroy]

  def show
    if @implement
      render :show, status: :ok
    else
      render json: { message: 'Implementation not found' }, status: :not_found
    end
  end

  def create
    @implement = Implement.new(implement_params)
    if @implement.save
      render :show, status: :created, location: @implement
    else
      render json: @implement.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @implement && @implement.destroy
      render json: { message: 'Implementation deleted successfully' },
             status: :ok
    else
      render json: { message: 'Implementation could not be deleted' },
             status: :not_acceptable
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_implement
    @implement = Implement.find_by(id: params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def implement_params
    params.require(:implement).permit(:plan_id, blog_attributes:
      %i[day_before change day_after obs advances obstacles ideas])
  end
end
