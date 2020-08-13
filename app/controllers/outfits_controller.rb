class OutfitsController < ApplicationController
  before_action :set_outfit, only: [:show, :edit, :update, :destroy]

  # GET /outfits
  def index
    @pagy, @outfits = pagy(Outfit.sort_by_params(params[:sort], sort_direction))

    # We explicitly load the records to avoid triggering multiple DB calls in the views when checking if records exist and iterating over them.
    # Calling @outfits.any? in the view will use the loaded records to check existence instead of making an extra DB call.
    @outfits.load
  end

  # GET /outfits/1
  def show
  end

  # GET /outfits/new
  def new
    @outfit = Outfit.new
  end

  # GET /outfits/1/edit
  def edit
  end

  # POST /outfits
  def create
    @outfit = Outfit.new(outfit_params)

    if @outfit.save
      redirect_to @outfit, notice: "Outfit was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /outfits/1
  def update
    if @outfit.update(outfit_params)
      redirect_to @outfit, notice: "Outfit was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /outfits/1
  def destroy
    @outfit.destroy
    redirect_to outfits_url, notice: "Outfit was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_outfit
    @outfit = Outfit.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def outfit_params
    params.require(:outfit).permit(:user_id, :account_id, :brand_id, :name, :description, :occasion, :dress_code, :total_number_of_products, :total_price)
  end
end
