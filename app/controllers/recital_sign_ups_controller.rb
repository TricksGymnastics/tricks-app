class RecitalSignUpsController < ApplicationController
  load_and_authorize_resource #:except => [:new, :create]
  before_action :set_recital_sign_up, only: [:show, :edit, :update, :destroy]

  # GET /recital_sign_ups
  def index
    @recital_sign_ups = RecitalSignUp.all.order("created_at DESC")
  end

  # GET /recital_sign_ups/1
  def show
  end

  # GET /recital_sign_ups/new
  def new
    @recital_sign_up = RecitalSignUp.new
  end

  # GET /recital_sign_ups/1/edit
  def edit
  end

  # POST /recital_sign_ups
  def create
    @recital_sign_up = RecitalSignUp.new(recital_sign_up_params)

    if @recital_sign_up.save
      # RecitalSignupMailer.gym_notification(@recital_sign_up).deliver_now
      redirect_to thankyou_path, notice: 'You successfully signed up for the Recital! Thank You.'
    else
      render :new
    end
  end

  # PATCH/PUT /recital_sign_ups/1
  def update
    if @recital_sign_up.update(recital_sign_up_params)
      redirect_to @recital_sign_up, notice: 'Recital sign up was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /recital_sign_ups/1
  def destroy
    @recital_sign_up.destroy
    redirect_to recital_sign_ups_url, notice: 'Recital sign up was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recital_sign_up
      @recital_sign_up = RecitalSignUp.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def recital_sign_up_params
      params.require(:recital_sign_up).permit(:child_first_name, :child_last_name, :location, :participating, :total_recitals, :multiple_recitals, :multiple_children, :costume_fee_agreement, :recital_fee_agreement)
    end
end
