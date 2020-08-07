class DressesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_dress, only: [:show, :edit, :update, :destroy]

  after_action :verify_authorized

  # GET /dresses
  def index
    @pagy, @dresses = pagy(Dress.sort_by_params(params[:sort], sort_direction))

    # We explicitly load the records to avoid triggering multiple DB calls in the views when checking if records exist and iterating over them.
    # Calling @dresses.any? in the view will use the loaded records to check existence instead of making an extra DB call.
    @dresses.load
  end

  # GET /dresses/1
  def show
  end

  # GET /dresses/new
  def new
    @dress = Dress.new
  end

  # GET /dresses/1/edit
  def edit
  end

  # POST /dresses
  def create
    @dress = Dress.new(dress_params.merge(user_id: current_user.id))

    if @dress.save
      redirect_to @dress, notice: "Dress was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /dresses/1
  def update
    if @dress.update(dress_params)
      redirect_to @dress, notice: "Dress was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /dresses/1
  def destroy
    @dress.destroy
    redirect_to dresses_url, notice: "Dress was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_dress
    @dress = Dress.friendly.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def dress_params
    params.require(:dress).permit(:user_id, :brand_id, :name, { product_images_attributes: [] }, :description, :retail_price, :type_of, :gender, :materials, :primary_color, :secondary_color, :product_url)
  end
end
