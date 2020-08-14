class CatalogsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_catalog, only: [:show, :edit, :update, :destroy, :like, :favorite]

  # after_action :verify_authorized

  # GET /catalogs
  def index
    @pagy, @catalogs = pagy(Catalog.sort_by_params(params[:sort], sort_direction))

    # We explicitly load the records to avoid triggering multiple DB calls in the views when checking if records exist and iterating over them.
    # Calling @catalogs.any? in the view will use the loaded records to check existence instead of making an extra DB call.
    @catalogs.load
  end

  # GET /catalogs/1
  def show
  end

  # GET /catalogs/new
  def new
    @catalog = Catalog.new
  end

  # GET /catalogs/1/edit
  def edit
  end

  # POST /catalogs
  def create
    @catalog = Catalog.new(catalog_params)
    @catalog.user = current_user
    @catalog.account = current_account
    @catalog.brand = current_account.brand if !current_account.personal?

    if @catalog.save
      redirect_to @catalog, notice: "Catalog was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /catalogs/1
  def update
    if @catalog.update(catalog_params)
      redirect_to @catalog, notice: "Catalog was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /catalogs/1
  def destroy
    @catalog.destroy
    redirect_to catalogs_url, notice: "Catalog was successfully destroyed."
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_catalog
      @catalog = Catalog.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def catalog_params
      params.require(:catalog).permit(:user_id, :account_id, :brand_id, :title, :description, :category, :total_items, :total_price)
    end
end
