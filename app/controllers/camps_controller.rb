class CampsController < ApplicationController
  before_action :set_camp, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource :except => [:index]

  # GET /camps
  def index
    @camps = Camp.where('registration_closes >= ?', Date.current).order(:registration_opens)
  end

  # GET /camps/1
  def show
  end

  # GET /camps/new
  def new
    @camp = Camp.new
  end

  # GET /camps/1/edit
  def edit
    @camp.registration_opens = @camp.registration_opens.strftime("%B %-d, %Y")
    @camp.registration_closes = @camp.registration_closes.strftime("%B %-d, %Y")
  end

  # POST /camps
  def create
    @camp = Camp.new(camp_params)

    if @camp.save
      redirect_to camps_path, notice: 'Camp was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /camps/1
  def update
    if @camp.update(camp_params)
      redirect_to camps_path, notice: 'Camp was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /camps/1
  def destroy
    @camp.destroy
    redirect_to camps_url, notice: 'Camp was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_camp
      @camp = Camp.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def camp_params
      params.require(:camp).permit(:title, :registration_opens, :registration_closes, :image, :description)
    end
end
