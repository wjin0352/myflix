class VideosController < ApplicationController

  def index
    @categories = Category.all
  end

  def new
    @video = Video.new
  end

  def show
    @video = Video.find(params[:id])
  end

  def search
    @videos = Video.search_by_title(params[:name])
  end

  private

  def video_params
    params.require(:video).permit(:title, :description, :small_cover_url, :large_cover_url, :cover_image_url)
  end


end
