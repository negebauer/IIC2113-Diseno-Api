class ApplicationController < ActionController::API

  def index
    @on = true
    @timestamp = DateTime.now.strftime("%d/%m/%Y %H:%M")
  end

end
