class SurveysController < ApplicationController
  before_action :set_survey, only: %i[show update destroy]

  # GET /surveys
  # GET /surveys.json
  def index
    @surveys = Survey.all
  end

  # GET /surveys/1
  # GET /surveys/1.json
  def show; end

  # POST /surveys
  # POST /surveys.json
  def create
    @survey = Survey.new(survey_params)

    if @survey.save
      render :show, status: :created, location: @survey
    else
      render json: @survey.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /surveys/1
  # PATCH/PUT /surveys/1.json
  def update
    if @survey.update(survey_params)
      render :show, status: :ok, location: @survey
    else
      render json: @survey.errors, status: :unprocessable_entity
    end
  end

  # DELETE /surveys/1
  # DELETE /surveys/1.json
  def destroy
    @survey.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_survey
    @survey = Survey.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def survey_params
    params.require(:survey).permit(:evaluation_id, :result)
  end
end
