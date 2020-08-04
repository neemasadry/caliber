class ShoesController < ApplicationController
  before_action :set_shoe, only: [:show, :edit, :update, :destroy]

  # GET /shoes
  def index
    @pagy, @shoes = pagy(Shoe.sort_by_params(params[:sort], sort_direction))

    # We explicitly load the records to avoid triggering multiple DB calls in the views when checking if records exist and iterating over them.
    # Calling @shoes.any? in the view will use the loaded records to check existence instead of making an extra DB call.
    @shoes.load
  end

  # GET /shoes/1
  def show
  end

  # GET /shoes/new
  def new
    @shoe = Shoe.new
  end

  # GET /shoes/1/edit
  def edit
  end

  # POST /shoes
  def create
    @shoe = Shoe.new(shoe_params)

    if @shoe.save
      redirect_to @shoe, notice: "Shoe was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /shoes/1
  def update
    if @shoe.update(shoe_params)
      redirect_to @shoe, notice: "Shoe was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /shoes/1
  def destroy
    @shoe.destroy
    redirect_to shoes_url, notice: "Shoe was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_shoe
    @shoe = Shoe.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def shoe_params
    params.require(:shoe).permit(:user_id, :brand_id, :name, :product_image_data, :description, :retail_price, :type_of, :gender, :materials, :primary_color, :secondary_color, :product_url)
  end
end
