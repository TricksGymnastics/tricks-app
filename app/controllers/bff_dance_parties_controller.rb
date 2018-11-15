class BffDancePartiesController < ApplicationController
  load_and_authorize_resource# :except => [:index, :show]
  before_action :set_bff_dance_party, only: [:show, :edit, :update, :destroy]

  # GET /bff_dance_parties
  def index
    #Article.where("published_at >= ?", Time.current)
    @bff_dance_parties = BffDanceParty.where("date >= ?", Date.today).order(:date)
  end

  # GET /bff_dance_parties/1
  def show
  end

  # GET /bff_dance_parties/new
  def new
    @bff_dance_party = BffDanceParty.new
  end

  # GET /bff_dance_parties/1/edit
  def edit
  end

  # POST /bff_dance_parties
  def create
    @bff_dance_party = BffDanceParty.new(bff_dance_party_params)

    if @bff_dance_party.save
      redirect_to bff_dance_parties_path, notice: 'Bff dance party was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /bff_dance_parties/1
  def update
    if @bff_dance_party.update(bff_dance_party_params)
      redirect_to bff_dance_parties_path, notice: 'Bff dance party was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /bff_dance_parties/1
  def destroy
    @bff_dance_party.destroy
    redirect_to bff_dance_parties_url, notice: 'Bff dance party was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bff_dance_party
      @bff_dance_party = BffDanceParty.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def bff_dance_party_params
      params.require(:bff_dance_party).permit(:name, :date, :suggestion, :granite_bay_start_time,:granite_bay_duration,:folsom_start_time, :folsom_duration, :sacramento_start_time, :sacramento_duration, :image)
    end
end
