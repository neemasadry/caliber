class BottomsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_bottom, only: [:show, :edit, :update, :destroy]

  after_action :verify_authorized

  # GET /bottoms
  def index
    @pagy, @bottoms = pagy(Bottom.sort_by_params(params[:sort], sort_direction))

    # We explicitly load the records to avoid triggering multiple DB calls in the views when checking if records exist and iterating over them.
    # Calling @bottoms.any? in the view will use the loaded records to check existence instead of making an extra DB call.
    @bottoms.load
  end

  # GET /bottoms/1
  def show
  end

  # GET /bottoms/new
  def new
    @bottom = Bottom.new
  end

  # GET /bottoms/1/edit
  def edit
  end

  # POST /bottoms
  def create
    @bottom = Bottom.new(bottom_params.merge(user_id: current_user.id))

    if @bottom.save
      redirect_to @bottom, notice: "Bottom was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /bottoms/1
  def update
    if @bottom.update(bottom_params)
      redirect_to @bottom, notice: "Bottom was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /bottoms/1
  def destroy
    @bottom.destroy
    redirect_to bottoms_url, notice: "Bottom was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_bottom
    @bottom = Bottom.friendly.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def bottom_params
    params.require(:bottom).permit(:user_id, :brand_id, :name, { product_images_attributes: [] }, :description, :retail_price, :retail_price, :type_of, :gender, :materials, :primary_color, :secondary_color, :product_url)
  end
end
