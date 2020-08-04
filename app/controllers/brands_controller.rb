class BrandsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_brand, only: [:show, :edit, :update, :destroy]

  # GET /brands
  def index
    @pagy, @brands = pagy(Brand.sort_by_params(params[:sort], sort_direction))

    # We explicitly load the records to avoid triggering multiple DB calls in the views when checking if records exist and iterating over them.
    # Calling @brands.any? in the view will use the loaded records to check existence instead of making an extra DB call.
    @brands.load
  end

  # GET /brands/1
  def show
  end

  # GET /brands/new
  def new
    @brand = Brand.new
  end

  # GET /brands/1/edit
  def edit
  end

  # POST /brands
  def create
    @brand = Brand.new(brand_params.merge(user_id: current_user.id))

    if @brand.save
      redirect_to @brand, notice: "Brand was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /brands/1
  def update
    if @brand.update(brand_params)
      redirect_to @brand, notice: "Brand was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /brands/1
  def destroy
    @brand.destroy
    redirect_to brands_url, notice: "Brand was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_brand
    @brand = Brand.friendly.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def brand_params
    params.require(:brand).permit(:user_id, :account_id, :name, :alias, :brand_logo, :category, :price_range, :founding_date, :about, :story, :mission, :email, :phone, :address1, :address2, :city, :state_code, :country_code, :zipcode, :homepage_link, :instagram_link, :youtube_link, :facebook_link, :twitter_link, :snapchat_link, :tiktok_link, :pinterest_link)
  end
end