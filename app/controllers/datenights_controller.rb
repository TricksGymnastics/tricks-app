class DatenightsController < ApplicationController
  before_action :set_datenight, only: [:index, :edit, :update]
  load_and_authorize_resource :except => :index

  def index
  end

  def edit
  end

  def update
    respond_to do |format|
      if @datenight.update(datenight_params)
        format.html { redirect_to datenights_path, notice: 'Page was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @datenight.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_datenight
      @datenight = Datenight.first
    end

    # Only allow a trusted parameter "white list" through.
    def datenight_params
      # I tried to get this to work the correct way using permit, but the nested attributes were too annoying to work with in the form, so I left what was already working and just permit all now
      # params.require(:datenight).permit(:about, :image, :single_price, :sibling_price, :schedule_title, :when_time, :datenight_events_attributes)
      params.require(:datenight).permit!
    end
end
