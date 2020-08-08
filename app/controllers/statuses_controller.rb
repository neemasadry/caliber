class StatusesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_status, only: [:show, :edit, :update, :destroy]

  #after_action :verify_authorized

  # GET /statuses
  def index
    @pagy, @statuses = pagy(Status.sort_by_params(params[:sort], sort_direction))

    # We explicitly load the records to avoid triggering multiple DB calls in the views when checking if records exist and iterating over them.
    # Calling @statuses.any? in the view will use the loaded records to check existence instead of making an extra DB call.
    @statuses.load
  end

  # GET /statuses/1
  def show
  end

  # GET /statuses/new
  def new
    @status = Status.new
  end

  # GET /statuses/1/edit
  def edit
  end

  # POST /statuses
  def create
    @status = Status.new(status_params)

    @status.user = current_user
    @status.account = current_account

    unless current_account.personal?
      @status.brand = current_account.brand
    else
      @status.brand = nil
    end

    if @status.save
      redirect_to @status, notice: "Status was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /statuses/1
  def update
    if @status.update(status_params)
      redirect_to @status, notice: "Status was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /statuses/1
  def destroy
    @status.destroy
    redirect_to statuses_url, notice: "Status was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_status
    @status = Status.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def status_params
    params.require(:status).permit(:content, :status_image, :status_video, :status_tag_list)
  end
end
