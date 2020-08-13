class OutfitCatalogsController < ApplicationController
  before_action :set_outfit_catalog, only: [:show, :edit, :update, :destroy]

  # GET /outfit_catalogs
  def index
    @pagy, @outfit_catalogs = pagy(OutfitCatalog.sort_by_params(params[:sort], sort_direction))

    # We explicitly load the records to avoid triggering multiple DB calls in the views when checking if records exist and iterating over them.
    # Calling @outfit_catalogs.any? in the view will use the loaded records to check existence instead of making an extra DB call.
    @outfit_catalogs.load
  end

  # GET /outfit_catalogs/1
  def show
  end

  # GET /outfit_catalogs/new
  def new
    @outfit_catalog = OutfitCatalog.new
  end

  # GET /outfit_catalogs/1/edit
  def edit
  end

  # POST /outfit_catalogs
  def create
    @outfit_catalog = OutfitCatalog.new(outfit_catalog_params)

    if @outfit_catalog.save
      redirect_to @outfit_catalog, notice: "Outfit catalog was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /outfit_catalogs/1
  def update
    if @outfit_catalog.update(outfit_catalog_params)
      redirect_to @outfit_catalog, notice: "Outfit catalog was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /outfit_catalogs/1
  def destroy
    @outfit_catalog.destroy
    redirect_to outfit_catalogs_url, notice: "Outfit catalog was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_outfit_catalog
    @outfit_catalog = OutfitCatalog.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def outfit_catalog_params
    params.require(:outfit_catalog).permit(:user_id, :account_id, :brand_id, :title, :description, :category, :total_number_of_outfits, :total_price)
  end
end
