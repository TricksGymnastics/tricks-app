class TricksUVideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  def index
    @videos = TricksUVideo.all
    @categories = TricksUCategory.where(hidden: false).order(:weight)
    @category = TricksUCategory.where(title: params[:category]).first
    if (@category.nil?) then
      @videos_by_category = @videos
    else
      @videos_by_category = TricksUVideo.where(category_id: @category.id).order(:weight)
    end
  end

  def show
  end

  def new
    @video = TricksUVideo.new
  end

  def edit
  end

  def create
    @video = TricksUVideo.new(tricks_u_video_params)
    respond_to do |format|
      if @video.save
        format.html { redirect_to tricksu_path }
        format.json { render json: @video, status: :created, location: @video }
      else
        format.html { render action: "new" }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @video.update(tricks_u_video_params)
        format.html { redirect_to @video, notice: 'Video was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @video.destroy

    respond_to do |format|
      format.html { redirect_to tricks_u_videos_url }
      format.json { head :no_content }
    end
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = TricksUVideo.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tricks_u_video_params
      params.require(:tricks_u_video).permit(:title, :url, :weight, :category_id)
      # params.require(:tricks_u_video).permit!
    end
end
