class ExperiencesController < ApplicationController
  before_action :set_experience, only: %i[show update destroy]
  before_action :require_login

  # GET /experiences
  # GET /experiences.json
  def index
    @experiences = Experience.includes(:users).where(users: { id: current_user.id })
    render json: @experiences, include: { users: { only: %i[name mail] } }, except: %i[created_at updated_at]
  end

  # POST /experiences/1/users
  def invite
    @experience = Experience.find(params[:id])
    @users = User.where(id: params[:user_ids].split(',').map(&:to_i))
    @users.each do |user|
      @experience.users.push(user) unless @experience.users.include?(user)
    end
    render json: @experience, include: { users: { only: %i[name mail] } }, except: %i[created_at updated_at]
  end

  # GET /experiences/1
  # GET /experiences/1.json
  def show
    @experience = Experience.find(params[:id])
    render json: @experience, include: { users: { only: %i[name mail] } }, except: %i[created_at updated_at]
  end

  # POST /experiences
  # POST /experiences.json
  def create
    @experience = Experience.new(experience_params)
    @experience.users.push(current_user)

    if @experience.save
      render :show, status: :created, location: @experience
    else
      render json: @experience.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /experiences/1
  # PATCH/PUT /experiences/1.json
  def update
    if @experience.update(experience_params)
      render :show, status: :ok, location: @experience
    else
      render json: @experience.errors, status: :unprocessable_entity
    end
  end

  # DELETE /experiences/1
  # DELETE /experiences/1.json
  def destroy
    @experience.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_experience
    @experience = Experience.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def experience_params
    params.require(:experience).permit(:name, :description, :date)
  end
end
