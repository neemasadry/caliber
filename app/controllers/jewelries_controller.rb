class JewelriesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_jewelry, only: [:show, :edit, :update, :destroy]

  # GET /jewelries
  def index
    @pagy, @jewelries = pagy(Jewelry.sort_by_params(params[:sort], sort_direction))

    # We explicitly load the records to avoid triggering multiple DB calls in the views when checking if records exist and iterating over them.
    # Calling @jewelries.any? in the view will use the loaded records to check existence instead of making an extra DB call.
    @jewelries.load
  end

  # GET /jewelries/1
  def show
  end

  # GET /jewelries/new
  def new
    @jewelry = Jewelry.new
  end

  # GET /jewelries/1/edit
  def edit
  end

  # POST /jewelries
  def create
    @jewelry = Jewelry.new(jewelry_params)

    if @jewelry.save
      redirect_to @jewelry, notice: "Jewelry was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /jewelries/1
  def update
    if @jewelry.update(jewelry_params)
      redirect_to @jewelry, notice: "Jewelry was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /jewelries/1
  def destroy
    @jewelry.destroy
    redirect_to jewelries_url, notice: "Jewelry was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_jewelry
    @jewelry = Jewelry.friendly.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def jewelry_params
    params.require(:jewelry).permit(:user_id, :brand_id, :name, :product_image_data, :description, :retail_price, :type_of, :gender, :materials, :primary_color, :secondary_color, :product_url)
  end
end
