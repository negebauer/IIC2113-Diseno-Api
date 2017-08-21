class ApplicationController < ActionController::API

  def main
    render json: {on: true}
  end

end
