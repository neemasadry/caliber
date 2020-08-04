class AccessoriesController < ApplicationController
  before_action :set_accessory, only: [:show, :edit, :update, :destroy]

  # GET /accessories
  def index
    @pagy, @accessories = pagy(Accessory.sort_by_params(params[:sort], sort_direction))

    # We explicitly load the records to avoid triggering multiple DB calls in the views when checking if records exist and iterating over them.
    # Calling @accessories.any? in the view will use the loaded records to check existence instead of making an extra DB call.
    @accessories.load
  end

  # GET /accessories/1
  def show
  end

  # GET /accessories/new
  def new
    @accessory = Accessory.new
  end

  # GET /accessories/1/edit
  def edit
  end

  # POST /accessories
  def create
    @accessory = Accessory.new(accessory_params)

    if @accessory.save
      redirect_to @accessory, notice: "Accessory was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /accessories/1
  def update
    if @accessory.update(accessory_params)
      redirect_to @accessory, notice: "Accessory was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /accessories/1
  def destroy
    @accessory.destroy
    redirect_to accessories_url, notice: "Accessory was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_accessory
    @accessory = Accessory.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def accessory_params
    params.require(:accessory).permit(:user_id, :brand_id, :name, :product_image_data, :description, :retail_price, :retail_price, :type_of, :gender, :materials, :primary_color, :secondary_color, :product_url)
  end
end
