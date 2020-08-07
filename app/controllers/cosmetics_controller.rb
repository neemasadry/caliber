class CosmeticsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_cosmetic, only: [:show, :edit, :update, :destroy]

  after_action :verify_authorized

  # GET /cosmetics
  def index
    @pagy, @cosmetics = pagy(Cosmetic.sort_by_params(params[:sort], sort_direction))

    # We explicitly load the records to avoid triggering multiple DB calls in the views when checking if records exist and iterating over them.
    # Calling @cosmetics.any? in the view will use the loaded records to check existence instead of making an extra DB call.
    @cosmetics.load
  end

  # GET /cosmetics/1
  def show
  end

  # GET /cosmetics/new
  def new
    @cosmetic = Cosmetic.new
  end

  # GET /cosmetics/1/edit
  def edit
  end

  # POST /cosmetics
  def create
    @cosmetic = Cosmetic.new(cosmetic_params.merge(user_id: current_user.id))

    if @cosmetic.save
      redirect_to @cosmetic, notice: "Cosmetic was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /cosmetics/1
  def update
    if @cosmetic.update(cosmetic_params)
      redirect_to @cosmetic, notice: "Cosmetic was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /cosmetics/1
  def destroy
    @cosmetic.destroy
    redirect_to cosmetics_url, notice: "Cosmetic was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cosmetic
    @cosmetic = Cosmetic.friendly.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def cosmetic_params
    params.require(:cosmetic).permit(:user_id, :brand_id, :name, { product_images_attributes: [] }, :description, :retail_price, :type_of, :gender, :ingredients, :product_url)
  end
end
