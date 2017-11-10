class MethoodsController < ApplicationController
  def index
    @methods = Methood.methodologies
    render json: @methods, status: :ok,
           except: %i[created_at updated_at description video]
  end

  def show
    @method = Methood.find_by(id: params[:id])
    if @method
      render json: @method, status: :ok,
             except: %i[created_at updated_at description video]
    else
      render json: { message: 'Method not found' }, status: :not_found
    end
  end
end
