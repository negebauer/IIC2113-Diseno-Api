class BlogsController < ApplicationController
  before_action :set_blog, only: %i[show update]

  def show
    if @blog
      render :show, status: :ok
    else
      render json: { message: 'Blog not found' }, status: :not_found
    end
  end

  def update
    if @blog.update(blog_params)
      render :show, status: :ok, location: @blog
    else
      render json: @blog.errors, status: :unprocessable_entity
    end
  end

  private

  def set_blog
    @blog = Blog.find_by(id: params[:id])
  end

  def blog_params
    params.require(:blog).permit(:day_before, :change, :day_after, :obs,
                                 :advances, :obstacles, :ideas)
  end
end
