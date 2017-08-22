# ApplicationController
class ApplicationController < ActionController::API
  def index
    @on = true
    @timestamp = DateTime.now.strftime.in_time_zone
  end
end
