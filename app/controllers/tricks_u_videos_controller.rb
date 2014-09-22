class TricksUVideosController < ApplicationController
  load_and_authorize_resource

  def index
    @videos = TricksUVideo.all
    @categories = TricksUCategory.where(hidden: false).all(order: 'weight')
    @category = TricksUCategory.where(title: params[:category]).first
    if (@category.nil?) then
      @videos_by_category = @videos
    else
      @videos_by_category = TricksUVideo.find_all_by_category_id(@category.id, order: "weight")
    end


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @video }
    end
  end

  def show
    @video = TricksUVideo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @video }
    end
  end

  def new
    @video = TricksUVideo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @video }
    end
  end

  def edit
    @video = TricksUVideo.find(params[:id])
  end

  def create
    @video = TricksUVideo.new(params[:tricks_u_video])

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
    @video = TricksUVideo.find(params[:id])

    respond_to do |format|
      if @video.update_attributes(params[:tricks_u_video])
        format.html { redirect_to @video, notice: 'Video was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @video = TricksUVideo.find(params[:id])
    @video.destroy

    respond_to do |format|
      format.html { redirect_to tricks_u_videos_url }
      format.json { head :no_content }
    end
  end
end
