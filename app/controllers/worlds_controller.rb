class WorldsController < ApplicationController
  before_action :set_world, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource :except => [:new, :create]
  # GET /worlds
  # GET /worlds.json
  def index
    @worlds = World.all
  end

  # GET /worlds/1
  # GET /worlds/1.json
  def show
  end

  # GET /worlds/new
  # GET /worlds/new.json
  def new
    @world = World.new
  end

  # GET /worlds/1/edit
  def edit
  end

  # POST /worlds
  # POST /worlds.json
  def create
    @world = World.new(world_params)

    respond_to do |format|
      if @world.save
        format.html { redirect_to 'http://www.tricksgym.com/thankyou' }
        format.json { render json: @world, status: :created, location: @world }
      else
        format.html { render action: "new" }
        format.json { render json: @world.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /worlds/1
  # PUT /worlds/1.json
  def update
    respond_to do |format|
      if @world.update(world_params)
        format.html { redirect_to @world, notice: 'World was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @world.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /worlds/1
  # DELETE /worlds/1.json
  def destroy
    @world.destroy

    respond_to do |format|
      format.html { redirect_to worlds_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_world
      @world = World.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def world_params
      params.require(:world).permit(:date, :first_name, :image, :last_name, :location)
    end
end
