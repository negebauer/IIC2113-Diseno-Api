class ProfileController < ApplicationController
  before_action :require_login

  # GET /profile
  # GET /profile.json
  def index
    render json: current_user
  end
end
