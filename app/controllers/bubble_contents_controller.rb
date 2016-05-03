class BubbleContentsController < ApplicationController
  before_action :set_bubble_content, only: [:show, :edit, :update, :destroy]
  # GET /bubble_contents
  def index
    @bubble_contents = BubbleContent.all.order(:sort_order)
  end

  # GET /bubble_contents/1
  def show
  end

  # GET /bubble_contents/new
  def new
    @bubble_content = BubbleContent.new
  end

  # GET /bubble_contents/1/edit
  def edit
  end

  # POST /bubble_contents
  def create
    @bubble_content = BubbleContent.new(bubble_content_params)

    if @bubble_content.save
      redirect_to @bubble_content, notice: 'Bubble content was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /bubble_contents/1
  def update
    if @bubble_content.update(bubble_content_params)
      redirect_to @bubble_content, notice: 'Bubble content was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /bubble_contents/1
  def destroy
    @bubble_content.destroy
    redirect_to bubble_contents_url, notice: 'Bubble content was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bubble_content
      @bubble_content = BubbleContent.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def bubble_content_params
      params.require(:bubble_content).permit(:link, :image, :color, :text, :text_color, :show_button, :sort_order)
    end
end
